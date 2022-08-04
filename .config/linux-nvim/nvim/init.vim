filetype plugin on
filetype indent on
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
set noswapfile
set nobackup
set noundofile
set mouse=a
set guifont=Hack\ NF:h12:cANSI
set noshowmode
set nowritebackup
set nocompatible " Use Vim defaults (much better!), Vi is for 70's programmers!
set bs=2 " allow backspacing over everything in insert mode
set clipboard=unnamed,unnamedplus "set clipboard to universal for easy copy/paste to diff apps 
set completeopt=menuone,noinsert,noselect
set showmatch
syntax on " Switch on syntax highlighting.
set hidden " This option allows you to switch between multiple buffers without saving a changed buffer
set mousehide " Hide the mouse pointer while typing.
set cmdheight=2 "give more space for displaying messages.
set shortmess+=c "don't pass messages to |ins-completion-menu|.
set cc=

" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
autocmd BufEnter * call CHANGE_CURR_DIR()
function! CHANGE_CURR_DIR()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"font for neovide
set guifont=Hack\ NF:h19
"check

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Plugins

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'overcache/neosolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':tsupdate'}
Plug 'vim-syntastic/syntastic'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-obsession'
Plug 'karb94/neoscroll.nvim'
"Plug 'mhinz/vim-startify'
"Plug 'tpope/vim-surround'
"Plug '907th/vim-auto-save'

if has("nvim")
    Plug 'hoob3rt/lualine.nvim'
    " Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do':  ':tsupdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else 
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"some keybinds for convenience
let mapleader = " "
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>s :so%<cr>
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap qq <esc>
vnoremap qq <esc>
nmap <C-t> :F<cr>
nmap <leader>/ gcc

"some windows keybinds
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap tn :tabnew<Return><C-w>w
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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"idk what is this for
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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"everything for running c++ files
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
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
"let g:split_term_resize_cmd = 'resize 6'


let g:fff#split = "30vnew"

if has('win32')
    set rtp^=$home
endif

"for vscode neovim
if exists('g:vscode')
    " vscode extension
else 
    " ordinary neovim
endif

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

"Everything of CoC.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" goto code navigation.
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)


" javascript extensions for coc
let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-prettier',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-emmet',
            \ 'coc-css',
            \    ]

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

"neoscroll.nvim file
lua require('neoscroll').setup()

