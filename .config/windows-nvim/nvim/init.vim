" just for editing files in windows terminal  this is a minimal init.vim
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
set nowritebackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set hlsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=no  
set mouse=a
set clipboard=unnamed
" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
autocmd BufEnter * call CHANGE_CURR_DIR()

function! CHANGE_CURR_DIR()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction

"font for neovide
set guifont=Hack\ NF:h19
"check

" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set cc=

"plugins
call plug#begin('C:\Users\sunny\AppData\Local\nvim\autoload\plugged')
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'hoob3rt/lualine.nvim'
Plug 'overcache/NeoSolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
call plug#end()

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
endif

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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"just to make those backup files in another directory so as to not make a mess
" make the directories if not present in userprofile(sunny) directory  
let &directory = expand('~\vimfiles\swap')

set backup
let &backupdir = expand('~\vimfiles\backup')

set undofile
let &undodir = expand('~\vimfiles\undo')

if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

    "Use NeoSolarized
    let g:neosolarized_termtrans=1
    runtime ./colors/NeoSolarized.vim
    colorscheme NeoSolarized
endif


"Workaround for creating transparent bg
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr     ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn ctermbg=NONE guibg=NONE


" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
