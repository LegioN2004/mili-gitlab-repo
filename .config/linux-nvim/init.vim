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
"set clipboard to universal for easy copy/paste to diff apps
set clipboard=unnamed,unnamedplus
" set signcolumn=no  
set mouse=a
" give more space for displaying messages.
set cmdheight=2
" don't pass messages to |ins-completion-menu|.
set shortmess+=c
set cc=

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

"plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'overcache/neosolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':tsupdate'}

if has("nvim")
    Plug 'hoob3rt/lualine.nvim'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do':  ':tsupdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/defx.vim'
    Plug 'roxman/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"some keybinds for easy saving and closing and something
let mapleader = " "
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>s :so%<cr>
"remaping ctrl + c to copy to system clipboard
vnoremap <C-c> "*y
vnoremap <C-v> "*p
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap qq <esc>
vnoremap qq <esc>
nmap <C-t> :F<cr>
nmap <leader>/ gcc

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

"vim-fugitive intergration remaps
" nmap <leader>gs :g<cr>
"nmap <leader>gh :diffget //3<cr>
"nmap <leader>gu :diffget //2<cr>


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"running cpp files
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
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

     "use neosolarized
     let g:neosolarized_termtrans=1
     runtime ./colors/neosolarized.vim
     colorscheme NeoSolarized
 endif


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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" " #syntastic-vim
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"vim commentary
autocmd FileType apache setlocal commentstring=#\ %s


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"defx setup
nnoremap <silent> <Leader>d :<C-U>:Defx -resume -buffer_name=explorer -split=vertical -vertical_preview<CR>

nnoremap <silent> - :<C-U>:Defx `expand('%:p:h')` -search=`expand('%:p')` -buffer-name=defx<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_tree', 'recursive:10') :
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> b
  \ defx#do_action('multi', ['close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree'])
  nnoremap <silent><buffer><expr> o
  \ match(bufname('%'), 'explorer') >= 0 ?
  \ (defx#is_directory() ? 0 : defx#do_action('drop', 'vsplit')) :
  \ (defx#is_directory() ? 0 : defx#do_action('multi', ['open', 'quit']))
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ? defx#do_action('open') : 0
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
endfunction
" '''

" hook_post_source = '''
call defx#custom#option('_', {
\ 'winwidth': 50,
\ 'ignored_files': '.*,target*',
\ 'direction': 'topleft',
\ 'toggle': 1,
\ 'columns': 'indent:git:icons:filename:mark',
\ })
" '''

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

