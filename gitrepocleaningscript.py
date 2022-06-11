#
# GitLab artifacts removal script - workaround for issue #228681
# Requires Python 3.7+
#

import requests
from datetime import datetime
from datetime import timedelta
import pytz

# Script configuration:
API_KEY = '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' # Your GitLab API Access Token
SERVER = 'gitlab.com/sunnybaruasins/dotfiles' # Server from which you'd like to remove artifacts (e.g. gitlab.com)
PROJECT_ID = 35815134 # ID of the project you want to clean up, can be found below the title on repo page
SKIP_DAYS_BACK = 14 # How old (in days) must a job be to be processed by this script


CURRENT_DATE = datetime.now(pytz.utc) 
MAX_CREATION_DATE = CURRENT_DATE - timedelta(SKIP_DAYS_BACK)


page_id = 1
loop = True

while loop:
  jobs = requests.get(f"https://{gitlab.com/sunnybaruasins/dotfiles}/api/v4/projects/{35815134}/jobs?page={page_id}", headers={'PRIVATE-TOKEN': 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})

  print(f"Processing page {page_id}...")

  for job in jobs.json():
    # Check if artifacts actually expired and if the job is older than SKIP_DAYS_BACK

    if job['artifacts_expire_at'] != None:
      expiry_date = datetime.fromisoformat(job['artifacts_expire_at'].replace('Z','+00:00'))
      creation_date = datetime.fromisoformat(job['created_at'].replace('Z','+00:00'))

      if CURRENT_DATE >= expiry_date and creation_date <= MAX_CREATION_DATE:
        # Ensure that artifacts_file is null

        if 'artifacts_file' not in job or job['artifacts_file'] == None:
          print(f"- Removing artifacts of job {job['id']}... ", end='')

          removal = requests.delete(f"https://{SERVER}/api/v4/projects/{PROJECT_ID}/jobs/{job['id']}/artifacts", headers={'PRIVATE-TOKEN': API_KEY})

          if removal.status_code >= 200 and removal.status_code < 300:
            print('OK!')
          else:
            print('Failed!')

  if 'X-Next-Page' not in jobs.headers or len(jobs.headers['X-Next-Page']) == 0:
    loop = False
  else:
    page_id = int(jobs.headers['X-Next-Page'])


print('Finished!')

