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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-airline/vim-airline'
" Plug 'joshdick/onedark.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'overcache/NeoSolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-syntastic/syntastic'
call plug#end()

"some keybinds for easy saving and closing
let mapleader = " "
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>s :so%<cr>

"nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
function! TermWrapper(command) abort
    if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
    if g:split_term_style ==# 'vertical'
        let buffercmd = 'vnew'
    elseif g:split_term_style ==# 'horizontal'
        let buffercmd = 'new'
    else
        echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
        throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
    endif
    if exists('g:split_term_resize_cmd')
        exec g:split_term_resize_cmd
    endif
    exec buffercmd
    exec 'term ' . a:command
    exec 'setlocal nornu nonu'
    "exec 'startinsert'
    "autocmd BufEnter <buffer> startinsert
endfunction

"vim-fugitive intergration remaps
"nmap <leader>gs :G<CR>
"nmap <leader>gh :diffget //3<CR>
"nmap <leader>gu :diffget //2<CR>

"remaping ctrl + c to copy to system clipboard
vnoremap <C-c> "*y

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"running cpp files
command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++17 %s && .\a.exe', expand('%')))
command! -nargs=1 CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && .\a.exe < %s', expand('%'), <args>))
autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>

" For those of you that like to use the default ./a.out
" This C++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
" NOTE: this version is more stable than the other version with specified
" output executable!
augroup CppToolkit
    autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 % && .\a.exe<CR>
    autocmd FileType cpp nnoremap <leader>fr :!.\a.exe<C>
    autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>
augroup END

" For those of you that like to use -o and a specific outfile executable
" (i.e., xyz.cpp makes executable xyz, as opposed to a.out
" This C++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
augroup CppToolkit
    autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 -o %:r % && .\%:r<CR>
    autocmd FileType cpp nnoremap <leader>fr :!.\%:r.out<CR>
augroup END

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
"let g:split_term_resize_cmd = 'resize 6'
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap qq <Esc>
vnoremap qq <Esc>
nmap <C-t> :F<cr>

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
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
