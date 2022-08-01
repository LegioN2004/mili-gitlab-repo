filetype plugin on 
filetype indent on
syntax on
au GUIEnter * simalt ~x
set splitbelow
set termguicolors
set splitright
set ai " always set autoindenting on
set si
set wildmenu
set showmatch
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set hlsearch
set scrolloff=8
set t_ut=?)
set t_Co=256
set wrap " wraps longs lines to screen size
set ruler
set hlsearch " Switch on search pattern highlighting.
set incsearch
set ignorecase 
set expandtab " always expands tab to spaces. It is good when peers use different editor.
set noswapfile
set nobackup
set noundofile
set mouse=a
set guifont=Hack\ NF:h12:cANSI
set nowritebackup
set nocompatible " Use Vim defaults (much better!), Vi is for 70's programmers!
set bs=2 " allow backspacing over everything in insert mode
set clipboard=unnamed,unnamedplus "set clipboard to universal for easy copy/paste to diff apps 
set completeopt=menuone,noinsert,noselect
set showmatch " show matching brackets
syntax on " Switch on syntax highlighting.
set hidden " This option allows you to switch between multiple buffers without saving a changed buffer
set mousehide " Hide the mouse pointer while typing.
set cmdheight=2
set shortmess+=c
set cc=

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"just to make those backup files in another directory so as to not make a mess
let &directory = expand('~\vimfiles\swap')

set backup
let &backupdir = expand('~\vimfiles\backup')

set undofile
let &undodir = expand('~\vimfiles\undo')

if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Plugins
call plug#begin('C:\Users\sunny\AppData\Local\nvim\autoload\plugged')
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-syntastic/syntastic'
if has ("gui_win32")
    Plug 'hoob3rt/lualine.nvim'
endif
call plug#end()


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'

let g:fff#split = "30vnew"

if has('win32')
    set rtp^=$HOME
endif

"if using vscode neovim
if exists('g:vscode')
    " VSCode extension
else 
    " ordinary neovim
endif



"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1. OS specific
set vb t_vb= " stop beeping or flashing the screen

" Force color and encoding. Put these near the top of the config file.
if has("win32")
    set t_Co=256
    set encoding=utf-8
endif
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
autocmd BufEnter * call CHANGE_CURR_DIR()

function! CHANGE_CURR_DIR()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" 7.1 Generic Programming Language setup
augroup prog
    au!
    " When starting to edit a file:
    " For *.c, *.cpp, *.java and *.h files set formatting of comments and set C-indenting on.
    " For other files switch it off.
    " Don't change the order, it's important that the line with * comes first.
    autocmd BufNewFile,BufRead,BufReadPost *       set formatoptions=tcql nocindent comments&
    autocmd BufNewFile,BufRead,BufReadPost *.c,*.h,*.cpp,*.java set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    autocmd BufNewFile,BufRead *.fun,*.pks,*.pkb,*.sql,*.pls,*.plsql    setf plsql
augroup END

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"some keybinds for convenience
let mapleader = " "
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>s :so %<cr>
vnoremap <C-c> "*y

" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set cc=

vnoremap <Esc> <C-[>
inoremap <Esc> <C-[>
inoremap qq <esc>
vnoremap qq <esc>
nmap <leader>/ gcc
vnoremap <leader>/ gc

"some windows keybinds
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap tn :tabnew<Return><C-w>w
" nmap tc :tabclose<Return><C-w>w
nmap <tab> :tabnext<Return>
nmap <S-tab> :tabprevious<Return>
" nmap <leader> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sl <C-w>l
map sj <C-w>j
map sk <C-w>k
"for resizing windows 
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 25 

"deoplete
let g:deoplete#enable_at_startup = 1

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"lualine settings
lua << END
require('lualine').setup()
END

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"devaslife style of NeoSolarized terminal and nvim combination

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


"workaround for creating transparent bg
" autocmd sourcepost * highlight normal     ctermbg=none guibg=none
"             \ |    highlight linenr     ctermbg=none guibg=none
"             \ |    highlight signcolumn ctermbg=none guibg=none



" " highlights "{{{
" " ---------------------------------------------------------------------
set cursorline
" " set cursorcolumn

" " set cursor line color on visual mode
" highlight visual cterm=none ctermbg=236 ctermfg=none guibg=grey40

" highlight linenr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" #syntastic-vim
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"vim commentary 
autocmd FileType apache setlocal commentstring=#\ %s

