filetype plugin on
filetype indent on
set splitbelow
set termguicolors
set splitright
set ai
set si
set wildmenu
set showmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set hlsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
" set signcolumn=no  
set mouse=a
"check
"
" give more space for displaying messages.
set cmdheight=2
" don't pass messages to |ins-completion-menu|.
set shortmess+=c
set cc=
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'overcache/neosolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':tsupdate'}
Plug 'vim-syntastic/syntastic'

if has("nvim")
    Plug 'hoob3rt/lualine.nvim'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do':  ':tsupdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

call plug#end()

let mapleader = " "
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>s :so%<cr>

"neovide
set guifont=NotoSans-Regular:h9


"set terminal type
"nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("grep for > ")})<cr>
function! Termwrapper(command) abort
    if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
    if g:split_term_style ==# 'vertical'
        let buffercmd = 'vnew'
    elseif g:split_term_style ==# 'horizontal'
        let buffercmd = 'new'
    else
        echoerr 'error! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
        throw 'error! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
    endif
    if exists('g:split_term_resize_cmd')
        exec g:split_term_resize_cmd
    endif
    exec buffercmd
    exec 'term ' . a:command
    exec 'setlocal nornu nonu'
    "exec 'startinsert'
    "autocmd bufenter <buffer> startinsert
endfunction

"vim-fugitive intergration remaps
" nmap <leader>gs :g<cr>
"nmap <leader>gh :diffget //3<cr>
"nmap <leader>gu :diffget //2<cr>
"remaping ctrl + c to copy to system clipboard

"everything for running c++ files
vnoremap <c-c> "*y
command! -nargs=0 CompileandRun call Termwrapper(printf('g++ -std=c++17 %s && ./a.out', expand('%')))
command! -nargs=1 CompileandRunwithfile call Termwrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%') , <args>))
autocmd filetype cpp nnoremap <leader>fw :CompileandRun<cr>


" for those of you that like to use the default ./a.out
" this c++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
" note: this version is more stable than the other version with specified
" output executable!
augroup cpptoolkit
    autocmd filetype cpp nnoremap <leader>fb :!g++ -std=c++17 % && ./a.out<cr>
    autocmd filetype cpp nnoremap <leader>fr :!./a.out<c>
    autocmd filetype cpp nnoremap <leader>fw :CompileandRun<cr>
augroup end

" for those of you that like to use -o and a specific outfile executable
" (i.e., xyz.cpp makes executable xyz, as opposed to a.out
" this c++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
augroup cpptoolkit
    autocmd filetype cpp nnoremap <leader>fb :!g++ -std=c++11 -o %:r % && ./%:r<cr>
    autocmd filetype cpp nnoremap <leader>fr :!./%:r.out<cr>
augroup end

" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
"let g:split_term_resize_cmd = 'resize 6'
" nnoremap h <up>
" nnoremap k <down>
" nnoremap j <left>
" nnoremap l <right>
"imap ii <esc>                      
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap qq <esc>
vnoremap qq <esc>
" vnoremap h <up>
" vnoremap k <down>
" vnoremap j <left>
" vnoremap l <right>
" nnoremap <c-r> <c-u>
" inoremap <c-r> <c-u>
" vnoremap <c-r> <c-u>
" nmap <c-t> :f<cr>

let g:fff#split = "30vnew"

if has('win32')
    set rtp^=$home
endif

if exists('g:vscode')
    " vscode extension
else 
    " ordinary neovim
endif

  " onedark.vim override: don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in gui mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
" if (has("autocmd") && !has("gui_running"))
"  augroup colorset
 "   autocmd!
  "  let s:white = { "gui": "#abb2bf", "cterm": "145", "cterm16" : "7" }
 "   autocmd colorscheme * call onedark#set_highlight("normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
 " augroup end
 " endif

 
 "everything related to neosolarized from devaslife
 "syntax theme 
 "true colors 
 if exists("&termguicolors") && exists("&winblend")
     syntax enable 
     set termguicolors
     set winblend=0
     set wildoptions=pum
     set pumblend=5
     set background=dark

     "use neosolarized
     let g:neosolarized_termtrans=1
     runtime ./colors/neosolarized.vim
     colorscheme NeoSolarized
 endif


"a part of coc.nvim
" use tab for trigger completion with characters ahead and navigate.
" note: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"starts from here
" inoremap <silent><expr> <tab>
"             \ pumvisible() ? "\<c-n>" :
"             \ <sid>check_back_space() ? "\<tab>" :
"             \ coc#refresh()
" inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
" inoremap <silent><expr> <cr> "\<c-g>u\<cr>"

" inoremap <expr> <tab> pumvisible() ? "\<c-y>" : "\<c-g>u\<tab>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"coc
" goto code navigation.
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

"workaround for creating transparent bg
autocmd sourcepost * highlight normal     ctermbg=none guibg=none
            \ |    highlight linenr     ctermbg=none guibg=none
            \ |    highlight signcolumn ctermbg=none guibg=none



" highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" set cursor line color on visual mode
highlight visual cterm=none ctermbg=236 ctermfg=none guibg=grey40

highlight linenr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000


" #syntastic-vim
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"vim commentary
" nnoremap <leader>/ <gcc>

" javascript extensions for coc
let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-prettier',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-emmet',
            \ 'coc-css',
            \    ]

"things for coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

