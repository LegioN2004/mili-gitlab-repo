// johntheripper.cpp


/* zip2john processes input ZIP files into a format suitable for use with JtR.
 *
 * This software is Copyright (c) 2011, Dhiru Kholia <dhiru.kholia at gmail.com>,
 * and it is hereby released to the general public under the following terms:
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted.
 *
 * Updated in Aug 2011 by JimF.  Added PKZIP 'old' encryption.  The signature on the
 * pkzip will be $pkzip$ and does not look like the AES version written by Dhiru
 * Also fixed some porting issues, such as variables needing declared at top of blocks.
 *
 * References:
 *
 * 1. http://www.winzip.com/aes_info.htm
 * 2. http://www.winzip.com/aes_tips.htm
 * 4. ftp://ftp.info-zip.org/pub/infozip/doc/appnote-iz-latest.zip
 * 5. Nathan Moinvaziri's work in extending minizip to support AES.
 * 6. http://oldhome.schmorp.de/marc/fcrackzip.html (coding hints)
 * 7. http://www.pkware.com/documents/casestudies/APPNOTE.TXT
 * 8. http://gladman.plushost.co.uk/oldsite/cryptography_technology/fileencrypt/index.php
 *   (borrowed files have "gladman_" prepended to them)
 * 9. http://svn.assembla.com/svn/os2utils/unzip60f/proginfo/extrafld.txt
 * 10. http://emerge.hg.sourceforge.net/hgweb/emerge/emerge/diff/c2f208617d32/Source/unzip/proginfo/extrafld.txt
 *
 * Usage:
 *
 * 1. Run zip2john on zip file(s) as "zip2john [zip files]".
 *    Output is written to standard output.
 * 2. Run JtR on the output generated by zip2john as "john [output file]".
 *
 * Output Line Format:
 *
 * For type = 0, for ZIP files encrypted using AES
 * filename:$zip$*type*hex(CRC)*encryption_strength*hex(salt)*hex(password_verfication_value):hex(authentication_code)
 *
 * For original pkzip encryption:  (JimF, with longer explaination of fields)
 * filename:$pkzip$C*B*[DT*MT{CL*UL*CR*OF*OX}*CT*DL*DA]*$/pkzip$
 *
 * All numeric and 'binary data' fields are stored in hex.
 *
 * C   is the count of hashes present (the array of items, inside the []  C can be 1 to 3.).
 * B   is number of valid bytes in the checksum (1 or 2).  Unix zip is 2 bytes, all others are 1
 * ARRAY of data starts here
 *   DT  is a "Data Type enum".  This will be 1 2 or 3.  1 is 'partial'. 2 and 3 are full file data (2 is inline, 3 is load from file).
 *   MT  Magic Type enum.  0 is no 'type'.  255 is 'text'. Other types (like MS Doc, GIF, etc), see source.
 *     NOTE, CL, DL, CRC, OFF are only present if DT != 1
 *     CL  Compressed length of file blob data (includes 12 byte IV).
 *     UL  Uncompressed length of the file.
 *     CR  CRC32 of the 'final' file.
 *     OF  Offset to the PK\x3\x4 record for this file data. If DT==2, then this will be a 0, as it is not needed, all of the data is already included in the line.
 *     OX  Additional offset (past OF), to get to the zip data within the file.
 *     END OF 'optional' fields.
 *   CT  Compression type  (0 or 8)  0 is stored, 8 is imploded.
 *   DL  Length of the DA data.
 *   DA  This is the 'data'.  It will be hex data if DT==1 or 2. If DT==3, then it is a filename (name of the .zip file).
 * END of array item.  There will be C (count) array items.
 * The format string will end with $/pkzip$
 */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <errno.h>
#include <string.h>
#include <assert.h>
//#include "common.h"
#include "misc.h"
#include "formats.h"

#include "stdint.h"

static int ascii_mode=0, checksum_only=0, use_magic=1;
static char *ascii_fname;

static char *MagicTypes[]= { "", "DOC", "XLS", "DOT", "XLT", "EXE", "DLL", "ZIP", "BMP", "DIB", "GIF", "PDF", "GZ", "TGZ", "BZ2", "TZ2", "FLV", "SWF", "MP3", NULL };
static int  MagicToEnum[] = {0,  1,    1,     1,     1,     2,     2,     3,     4,     4,     5,     6,     7,    7,     8,     8,     9,     10,    11,  0};

/* helper functions for byte order conversions, header values are stored
 * in little-endian byte order */
static uint32_t fget32(FILE * fp)
{
	uint32_t v = fgetc(fp);
	v |= fgetc(fp) << 8;
	v |= fgetc(fp) << 16;
	v |= fgetc(fp) << 24;
	return v;
}

static uint16_t fget16(FILE * fp)
{
	uint32_t v = fgetc(fp);
	v |= fgetc(fp) << 8;
	return v;
}

int convert_to_hex(char *O, unsigned char *H, int len) {
	int i;
	for (i = 0; i < len; ++i)
		O += sprintf (O, "%02x", *H++);
	return len<<1;
}

static void process_old_zip(const char *fname);
static void process_file(const char *fname)
{
	unsigned char filename[1024];
	FILE *fp;
	int i;

	if (!(fp = fopen(fname, "rb"))) {
		fprintf(stderr, "! %s : %s\n", fname, strerror(errno));
		return;
	}

	while (!feof(fp)) {
		uint32_t id = fget32(fp);

		if (id == 0x04034b50UL) {	/* local header */
			uint16_t version = fget16(fp);
			uint16_t flags = fget16(fp);
			uint16_t compression_method = fget16(fp);
			uint16_t lastmod_time = fget16(fp);
			uint16_t lastmod_date = fget16(fp);
			uint32_t crc = fget32(fp);
			uint32_t compressed_size = fget32(fp);
			uint32_t uncompressed_size = fget32(fp);
			uint16_t filename_length = fget16(fp);
			uint16_t extrafield_length = fget16(fp);
			/* unused variables */
			(void) version;
			(void) lastmod_time;
			(void) lastmod_date;
			(void) crc;
			(void) uncompressed_size;

			if (fread(filename, 1, filename_length, fp) != filename_length) {
				fprintf(stderr, "Error, in fread of file data!\n");
				goto cleanup;
			}
			filename[filename_length] = 0;

			if (compression_method == 99) {	/* AES encryption */
				uint16_t efh_id = fget16(fp);
				uint16_t efh_datasize = fget16(fp);
				uint16_t efh_vendor_version = fget16(fp);
				uint16_t efh_vendor_id = fget16(fp);
				char efh_aes_strength = fgetc(fp);
				uint16_t actual_compression_method = fget16(fp);
				unsigned char salt[16];
				int n = 0;
				uint16_t password_verification_value;
				unsigned char *p;

				fprintf(stderr,
				    "%s->%s is using AES encryption, extrafield_length is %d\n",
				    fname, filename, extrafield_length);
				/* unused variables */
				(void) efh_id;
				(void) efh_datasize;
				(void) efh_vendor_version;
				(void) efh_vendor_id;
				(void) efh_aes_strength;
				(void) actual_compression_method;

				printf("%s:$zip$*0*%d*", fname,
				    efh_aes_strength);
				switch (efh_aes_strength) {
				case 1:
					n = 8;
					if (fread(salt, 1, n, fp) != n) {
						fprintf(stderr, "Error, in fread of file data!\n");
						goto cleanup;
					}
					break;
				case 2:
					n = 12;
					if (fread(salt, 1, n, fp) != n) {
						fprintf(stderr, "Error, in fread of file data!\n");
						goto cleanup;
					}
					break;
				case 3:
					n = 16;
					if (fread(salt, 1, n, fp) != n) {
						fprintf(stderr, "Error, in fread of file data!\n");
						goto cleanup;
					}
					break;

				}
				for (i = 0; i < n; i++) {
					printf("%c%c",
					    itoa16[ARCH_INDEX(salt[i] >> 4)],
					    itoa16[ARCH_INDEX(salt[i] &
						    0x0f)]);
				}
				password_verification_value = fget16(fp);
				p = (unsigned char *) &password_verification_value;
				printf("*");
				for (i = 0; i < 2; i++) {
					printf("%c%c",
					    itoa16[ARCH_INDEX(p[i] >> 4)],
					    itoa16[ARCH_INDEX(p[i] & 0x0f)]);
				}
				printf("\n");
				fseek(fp, 10, SEEK_CUR);

			} else if (flags & 1) {	/* old encryption */
				fclose(fp);
				process_old_zip(fname);
				return;
			} else {
				fprintf(stderr, "%s->%s is not encrypted!\n", fname,
				    filename);
				fseek(fp, extrafield_length, SEEK_CUR);
				fseek(fp, compressed_size, SEEK_CUR);
			}
		} else if (id == 0x08074b50UL) {	/* data descriptor */
			fseek(fp, 12, SEEK_CUR);
		} else if (id == 0x02014b50UL || id == 0x06054b50UL) {	/* central directory structures */
			goto cleanup;
		}
	}

cleanup:
	fclose(fp);
}

/* instead of using anything from the process_file, we simply detected a encrypted old style
 * password, close the file, and call this function.  This function handles the older pkzip
 * password, while the process_file handles ONLY the AES from WinZip
 */
typedef struct _zip_ptr
{
	uint16_t      magic_type, cmptype;
	uint32_t      offset, offex, crc, cmp_len, decomp_len;
	char          chksum[5];
	char         *hash_data;
} zip_ptr;
typedef struct _zip_file
{
	int unix_made;
	int check_in_crc;
	int two_byte_check;
} zip_file;

static int magic_type(const char *filename) {
	char *Buf = str_alloc_copy((char*)filename), *cp;
	int i;

	if (!use_magic) return 0;

	strupr(Buf);
	if (ascii_fname && !strcasecmp(Buf, ascii_fname))
		return 255;

	cp = strrchr(Buf, '.');
	if (!cp) return 0;
	++cp;
	for (i = 1; MagicTypes[i]; ++i)
		if (!strcmp(cp, MagicTypes[i]))
			return MagicToEnum[i];
	return 0;
}
static char *toHex(unsigned char *p, int len) {
	static char Buf[4096];
	char *cp = Buf;
	int i;
	for (i = 0; i < len; ++i)
		cp += sprintf(cp, "%02x", p[i]);
	return Buf;
}
static int LoadZipBlob(FILE *fp, zip_ptr *p, zip_file *zfp, const char *zip_fname)
{
	uint16_t version,flags,lastmod_time,lastmod_date,filename_length,extrafield_length;
	unsigned char filename[1024];

	memset(p, 0, sizeof(*p));

	p->offset = ftell(fp)-4;
	version = fget16(fp);
	flags = fget16(fp);
	p->cmptype = fget16(fp);
	lastmod_time = fget16(fp);
	lastmod_date = fget16(fp);
	p->crc = fget32(fp);
	p->cmp_len= fget32(fp);
	p->decomp_len = fget32(fp);
	filename_length = fget16(fp);
	extrafield_length = fget16(fp);
	/* unused variables */
	(void) lastmod_date;

	if (fread(filename, 1, filename_length, fp) != filename_length) {
		fprintf(stderr, "Error, fread could not read the data from the file:  %s\n", zip_fname);
		return 0;
	}
	filename[filename_length] = 0;
	p->magic_type = magic_type((char*)filename);

	p->offex = 30 + filename_length + extrafield_length;

	// we only handle implode or store.
	// 0x314 was seen at 2012 CMIYC ?? I have to look into that one.
	if ( (version == 0x14||version==0xA||version == 0x314) && (flags & 1) && (p->cmptype == 8 || p->cmptype == 0)) {
		uint16_t extra_len_used = 0;
		if (flags & 8) {
			while (extra_len_used < extrafield_length) {
				uint16_t efh_id = fget16(fp);
				uint16_t efh_datasize = fget16(fp);
				extra_len_used += 4 + efh_datasize;
				fseek(fp, efh_datasize, SEEK_CUR);
				//http://svn.assembla.com/svn/os2utils/unzip60f/proginfo/extrafld.txt
				//http://emerge.hg.sourceforge.net/hgweb/emerge/emerge/diff/c2f208617d32/Source/unzip/proginfo/extrafld.txt
				if (efh_id == 0x07c8 ||  // Info-ZIP Macintosh (old, J. Lee)
					efh_id == 0x334d ||  // Info-ZIP Macintosh (new, D. Haase's 'Mac3' field)
					efh_id == 0x4d49 ||  // Info-ZIP OpenVMS (obsolete)
					efh_id == 0x5855 ||  // Info-ZIP UNIX (original; also OS/2, NT, etc.)
					efh_id == 0x6375 ||  // Info-ZIP UTF-8 comment field
					efh_id == 0x7075 ||  // Info-ZIP UTF-8 name field
					efh_id == 0x7855 ||  // Info-ZIP UNIX (16-bit UID/GID info)
					efh_id == 0x7875)    // Info-ZIP UNIX 3rd generation (generic UID/GID, ...)

					// 7zip ALSO is 2 byte checksum, but I have no way to find them.  NOTE, it is 2 bytes of CRC, not timestamp like InfoZip.
					// OLD winzip (I think 8.01 or before), is also supposed to be 2 byte.
					// old v1 pkzip (the DOS builds) are 2 byte checksums.
				{
					zfp->unix_made = 1;
					zfp->two_byte_check = 1;
					zfp->check_in_crc = 0;
				}
			}
		}
		else if (extrafield_length)
			fseek(fp, extrafield_length, SEEK_CUR);

		fprintf(stderr,
			"%s->%s PKZIP Encr:%s%s cmplen=%d, decmplen=%d, crc=%X\n",
			zip_fname, filename, zfp->two_byte_check?" 2b chk,":"", zfp->check_in_crc?"":" TS_chk,", p->cmp_len, p->decomp_len, p->crc);

		p->hash_data = mem_alloc_tiny(p->cmp_len+1, MEM_ALIGN_WORD);
		if (fread(p->hash_data, 1, p->cmp_len, fp) != p->cmp_len) {
			fprintf(stderr, "Error, fread could not read the data from the file:  %s\n", zip_fname);
			return 0;
		}

		// Ok, now set checksum bytes.  This will depend upon if from crc, or from timestamp
		if (zfp->check_in_crc)
			sprintf (p->chksum, "%02x%02x", (p->crc>>24)&0xFF, (p->crc>>16)&0xFF);
		else
			sprintf(p->chksum, "%02x%02x", lastmod_time>>8, lastmod_time&0xFF);

		return 1;

	}
	fprintf(stderr, "%s->%s is not encrypted, or stored with non-handled compression type\n", zip_fname, filename);
	fseek(fp, extrafield_length, SEEK_CUR);
	fseek(fp, p->cmp_len, SEEK_CUR);

	return 0;
}

static void process_old_zip(const char *fname)
{
	FILE *fp;

	int count_of_hashes = 0;
	zip_ptr hashes[3], curzip;
	zip_file zfp;

	zfp.check_in_crc = 1;
	zfp.two_byte_check = zfp.unix_made = 0;

	if (!(fp = fopen(fname, "rb"))) {
		fprintf(stderr, "! %s : %s\n", fname, strerror(errno));
		return;
	}

	while (!feof(fp)) {
		uint32_t id = fget32(fp);

		if (id == 0x04034b50UL) {	/* local header */
			if (LoadZipBlob(fp, &curzip, &zfp, fname) && curzip.decomp_len > 12) {
				if (!count_of_hashes)
					memcpy(&(hashes[count_of_hashes++]), &curzip, sizeof(curzip));
				else {
					if (count_of_hashes == 1) {
						if (curzip.cmp_len < hashes[0].cmp_len) {
							memcpy(&(hashes[count_of_hashes++]), &(hashes[0]), sizeof(curzip));
							memcpy(&(hashes[0]), &curzip, sizeof(curzip));
						} else
							memcpy(&(hashes[count_of_hashes++]), &curzip, sizeof(curzip));
					}
					else if (count_of_hashes == 2) {
						if (curzip.cmp_len < hashes[0].cmp_len) {
							memcpy(&(hashes[count_of_hashes++]), &(hashes[1]), sizeof(curzip));
							memcpy(&(hashes[1]), &(hashes[0]), sizeof(curzip));
							memcpy(&(hashes[0]), &curzip, sizeof(curzip));
						} else if (curzip.cmp_len < hashes[1].cmp_len) {
							memcpy(&(hashes[count_of_hashes++]), &(hashes[1]), sizeof(curzip));
							memcpy(&(hashes[1]), &curzip, sizeof(curzip));
						} else
							memcpy(&(hashes[count_of_hashes++]), &curzip, sizeof(curzip));
					}
					else {
						int done=0;
						if (curzip.magic_type && curzip.cmp_len > hashes[0].cmp_len) {
							// if we have a magic type, we will replace any NON magic type, for the 2nd and 3rd largest, without caring about
							// the size.
							if (hashes[1].magic_type == 0) {
								if (hashes[2].cmp_len < curzip.cmp_len) {
									memcpy(&(hashes[1]), &(hashes[2]), sizeof(curzip));
									memcpy(&(hashes[2]), &curzip, sizeof(curzip));
									done=1;
								} else {
									memcpy(&(hashes[1]), &curzip, sizeof(curzip));
									done=1;
								}
							} else if (hashes[2].magic_type == 0) {
								if (hashes[1].cmp_len < curzip.cmp_len) {
									memcpy(&(hashes[2]), &curzip, sizeof(curzip));
									done=1;
								} else {
									memcpy(&(hashes[2]), &(hashes[1]), sizeof(curzip));
									memcpy(&(hashes[1]), &curzip, sizeof(curzip));
									done=1;
								}
							}
						}
						if (!done && curzip.cmp_len < hashes[0].cmp_len) {
							// we 'only' replace the smallest zip, and always keep as many any other magic as possible.
							if (hashes[0].magic_type == 0)
								memcpy(&(hashes[0]), &curzip, sizeof(curzip));
							else {
								// Ok, the 1st is a magic, we WILL keep it.
								if (hashes[1].magic_type) {  // Ok, we found our 2
									memcpy(&(hashes[2]), &(hashes[1]), sizeof(curzip));
									memcpy(&(hashes[1]), &(hashes[0]), sizeof(curzip));
									memcpy(&(hashes[0]), &curzip, sizeof(curzip));
								} else if (hashes[2].magic_type) {  // Ok, we found our 2
									memcpy(&(hashes[1]), &(hashes[0]), sizeof(curzip));
									memcpy(&(hashes[0]), &curzip, sizeof(curzip));
								} else {
									// found none.  So we will simply roll them down (liek when #1 was a magic also).
									memcpy(&(hashes[2]), &(hashes[1]), sizeof(curzip));
									memcpy(&(hashes[1]), &(hashes[0]), sizeof(curzip));
									memcpy(&(hashes[0]), &curzip, sizeof(curzip));
								}
							}
						}
					}
				}
			}
		} else if (id == 0x08074b50UL) {	/* data descriptor */
			fseek(fp, 12, SEEK_CUR);
		} else if (id == 0x02014b50UL || id == 0x06054b50UL) {	/* central directory structures */
			goto print_and_cleanup;
		}
	}

print_and_cleanup:;
	if (count_of_hashes) {
		int i=1;
		printf ("%s:$pkzip$%x*%x*", fname, count_of_hashes, zfp.two_byte_check?2:1);
		if (checksum_only)
			i = 0;
		for (; i < count_of_hashes; ++i) {
			int len = 12+24;
			if (hashes[i].magic_type)
				len = 12+180;
			if (len > hashes[i].cmp_len)
				len = hashes[i].cmp_len; // even though we 'could' output a '2', we do not.  We only need one full inflate CRC check file.
			printf("1*%x*%x*%x*%s*%s*", hashes[i].magic_type, hashes[i].cmptype, len, hashes[i].chksum, toHex((unsigned char*)hashes[i].hash_data, len));
		}
		// Ok, now output the 'little' one (the first).
		if (!checksum_only) {
			printf("%x*%x*%x*%x*%x*%x*%x*%x*", hashes[0].cmp_len<1500?2:3, hashes[0].magic_type, hashes[0].cmp_len, hashes[0].decomp_len, hashes[0].crc, hashes[0].offset, hashes[0].offex, hashes[0].cmptype);
			if (hashes[0].cmp_len<1500)
				printf("%x*%s*%s*", hashes[0].cmp_len, hashes[0].chksum, toHex((unsigned char*)hashes[0].hash_data, hashes[0].cmp_len));
			else
				printf("%x*%s*%s*", (unsigned int)strlen(fname), hashes[0].chksum, fname);
		}
		printf("$/pkzip$\n");
	}
	fclose(fp);
}

int usage() {
	fprintf(stderr, "Usage: zip2john [options] [zip files]\n");
	fprintf(stderr, "\tOptions (for 'old' PKZIP encrypted files):\n");
	fprintf(stderr, "\t  -a=filename   This is a 'known' ASCII file\n");
	fprintf(stderr, "\t      Using 'ascii' mode is a serious speedup, IF all files are larger, and\n");
	fprintf(stderr, "\t      you KNOW that at least one of them starts out as 'pure' ASCII data\n");
	fprintf(stderr, "\t  -co This will create a 'checksum only' hash.  If there are many encrypted\n");
	fprintf(stderr, "\t      files in the .zip file, then this may be an option, and there will be\n");
	fprintf(stderr, "\t      enough data that false possitives will not be seen.  If the .zip is 2\n");
	fprintf(stderr, "\t      byte checksums, and there are 3 or more of them, then we have 48 bits\n");
	fprintf(stderr, "\t      knowledge, which 'may' be enough to crack the password, without having\n");
	fprintf(stderr, "\t      to force the user to have the .zip file present\n");
	fprintf(stderr, "\t  -nm DO not look for any magic file types in this zip.  If you know that\n");
	fprintf(stderr, "\t      are files with one of the 'magic' extensions, but they are not the right\n");
	fprintf(stderr, "\t      type files (some *.doc files that ARE NOT M$Office word documents), then\n");
	fprintf(stderr, "\t      this switch will keep them from being detected this way.  NOTE, that\n");
	fprintf(stderr, "\t      the 'magic' logic will only be used in john, under certain situations.\n");
	fprintf(stderr, "\t      Most of these situations are when there are only 'stored' files in the zip\n");
	return 0;
}
int zip2john(int argc, char **argv)
{
	int i=1;

	if (argc < 2)
		return usage();
	while (argv[i][0] == '-') {
		// handle both the -val and --val types of command line switches (since all the rest of john does this also).
		if (strstr(argv[i], "-a=")) {
			if (!strncmp(argv[i], "-a=", 3))
				ascii_fname = &argv[i][3];
			else if (!strncmp(argv[i], "--a=", 4))
				ascii_fname = &argv[i][4];
			else
				break;
			ascii_mode = 1;
			fprintf(stderr, "Using file %s as an 'ASCII' quick check file\n", ascii_fname);
			++i;
		}
		else if (!strcmp(argv[i], "-co") || !strcmp(argv[i], "--co")) {
			checksum_only = 1;
			++i;
			fprintf(stderr, "Outputing hashes that are 'checksum ONLY' hashes\n");
		}
		else if (!strcmp(argv[i], "-nm") || !strcmp(argv[i], "--nm")) {
			use_magic = 0;
			++i;
			fprintf(stderr, "Ignoring any checking of file 'magic' signatures\n");
		}
		else if (!strncmp(argv[i], "-h", 2) || !strncmp(argv[i], "--h", 3))
			return usage();
		else
			break; // file name starting with a '-' char.
	}
	for (; i < argc; i++)
		process_file(argv[i]);

	return 0;
}