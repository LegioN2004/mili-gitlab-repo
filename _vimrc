syntax on
au GUIEnter * simalt ~x
set showmode
set t_ut=""
set t_Co=256
set autoindent
set expandtab
set wrap 
set ruler
set showmatch
set hlsearch
set incsearch
set ignorecase 
set tabstop=4
set si
set softtabstop=4
set shiftwidth=4
colorscheme NeoSolarized
set noswapfile
set nobackup
set noundofile
set mouse=a
set guifont=Hack\ NF:h12:cANSI
set background=dark
set guioptions+=m
set termguicolors

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

" Show ligatures. It is not perfect and requires C-L to manually refresh.
set renderoptions=type:directx

" Fix the ugly cursor color
" hi Cursor guibg=#005f87 guifg=#eeeeee

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Plugins
call plug#begin('~/vimfiles/plugged')
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
        colorscheme NeoSolarized
        set bg=light
    elseif has("gui_macvim")
        set guifont=Meslo\ Regular:h14
        colorscheme NeoSolarized
        set bg=light
    elseif has("gui_win32")
        set guifont=Hack\ NF:h11:cANSI
        colorscheme NeoSolarized
        set bg=light
    endif
endif
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    " options
    " choose between 'vertical' and 'horizontal' for how the terminal window is split
    " (default is vertical)
    let g:split_term_style = 'vertical'


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    " 1. OS specific
    if ($OS == 'Windows_NT')
        " Windows specific settings

        " 1.1 Restore cursor to file position in previous editing session http://vim.wikia.com/wiki/VimTip80
        "set viminfo='10,\"100,:20,%,n$VIM/_viminfo

        " 1.2 executing OS command within Vim
        set shell=c:\Windows\system32\cmd.exe
        " shell command flag
        set shellcmdflag=/c
    else
        " Unix specific settings
        " 1.1 : pick it from $HOME/.viminfo
        "set viminfo='10,\"100,:20,%,n~/.viminfo

        " 1.2 executing OS command within Vim
        set shell=/bin/csh
    endif
    set nowritebackup
    set nocompatible " Use Vim defaults (much better!), Vi is for 70's programmers!
    "set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers - http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    set ts=4 " tabstop - how many columns should the cursor move for one tab
    set sw=4 " shiftwidth - how many columns should the text be indented
    set expandtab " always expands tab to spaces. It is good when peers use different editor.
    set wrap " wraps longs lines to screen size
    "highlight statuslinenc guifg=slateblue guibg=yellow
    "highlight statusline guifg=gray guibg=black
    "set vb t_vb= " stop beeping or flashing the screen

    " Force color and encoding. Put these near the top of the config file.
    if has("win32")
         set t_Co=256
        set encoding=utf-8
    endif

    if has("win32")

        " Use PowerShell as the shell
        " set shell=powershell.exe
        " set shellcmdflag=-nologo\ -noprofile\ -noninteractive\ -command
        " endif
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        source $VIMRUNTIME/vimrc_example.vim
        " 6. General file editing
        " 6.1 Common Settings to enable better editing
        "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        set bs=2 " allow backspacing over everything in insert mode
        set ai " always set autoindenting on

        set showmatch " show matching brackets
        syntax on " Switch on syntax highlighting.
        set hidden " This option allows you to switch between multiple buffers without saving a changed buffer
        set hlsearch " Switch on search pattern highlighting.
        set mousehide " Hide the mouse pointer while typing.


        " Easy pasting to windows apps - http://vim.wikia.com/wiki/VimTip21
        " yank always copies to unnamed register, so it is available in windows clipboard for other applications.
        set clipboard=unnamed,unnamedplus

        "Set the history size to maximum. by default it is 20 - http://vim.wikia.com/wiki/VimTip45
        set history=80

        "Plugins config - http://vim.sourceforge.net/script.php?script_id=448
        :filetype plugin on 

        " Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
        autocmd BufEnter * call CHANGE_CURR_DIR()

        " See Help documentation by entering command :help 'sessionoptions'
        set sessionoptions+=resize
        set sessionoptions+=winpos
        set sessionoptions+=folds
        set sessionoptions+=tabpages

        :hi Search ctermfg=red ctermbg=gray
        set suffixes+=.class,.exe,.obj,.dat,.dll " Show these file types at the end while using :edit command

        " " Configuration for explorer.vim to open the new file by doing vertical split and opening it in right window.
        " " For more info use command :help file-explorer
        " let g:explVertical=1	" Split vertically
        " let g:explSplitRight=1  " Put new window right of the explorer window
        " let c_comment_strings=1 " I like highlighting strings inside C comments

        " " Buffer Explorer - http://vim.sourceforge.net/scripts/script.php?script_id=159
        " let g:miniBufExplMapWindowNavVim = 1 
        " let g:miniBufExplMapWindowNavArrows = 1 
        " let g:miniBufExplMapCTabSwitchBuffs = 1

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

"8.2 Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64

        function! CHANGE_CURR_DIR()
            let _dir = expand("%:p:h")
            exec "cd " . _dir
            unlet _dir
        endfunction


        "leader f to compile , leader r to run
        autocmd filetype cpp nnoremap <leader>f :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
        autocmd filetype cpp nnoremap <leader>r :!%:r<CR>
        autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
        autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
        autocmd filetype cpp nnoremap <F10>r :!%:r<CR>

        set nu
        augroup numbertoggle
            autocmd!
            autocmd BufEnter,FocusGained,InsertLeave * set rnu
            autocmd BufLeave,FocusLost,InsertEnter * set nornu
        augroup END

        set diffexpr=MyDiff()
        function MyDiff()
            let opt = '-a --binary '
            if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
            if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
            let arg1 = v:fname_in
            if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
            let arg1 = substitute(arg1, '!', '\!', 'g')
            let arg2 = v:fname_new
            if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
            let arg2 = substitute(arg2, '!', '\!', 'g')
            let arg3 = v:fname_out
            if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
            let arg3 = substitute(arg3, '!', '\!', 'g')
            if $VIMRUNTIME =~ ' '
                if &sh =~ '\<cmd'
                    if empty(&shellxquote)
                        let l:shxq_sav = ''
                        set shellxquote&
                    endif
                    let cmd = '"' . $VIMRUNTIME . '\diff"'
                else
                    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
                endif
            else
                let cmd = $VIMRUNTIME . '\diff'
            endif
        endfunction


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

"workaround for creating original cursor style of vim if not available after
"installation
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"lualine with built in vim script
" Statusline (requires Powerline font)
set laststatus=2
set statusline=
set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
set statusline+=%< " Truncate line here
set statusline+=%f\  " File path, as typed or relative to current directory
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%1*\  " Set highlight group to User1
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ %* " Restore normal highlight
set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
set statusline+=%-2v " Virtual column number
set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|}}}}}}}

hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#93a1a1 guibg=#002732
hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#657b83 guibg=#073642
hi User1 ctermfg=14 ctermbg=0 guifg=#93a1a1 guibg=#073642


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"netrw settings

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 25 

"deoplete
let g:deoplete#enable_at_startup = 1
