local set = vim.opt

set.expandtab = true
set.smarttab = true
set.tabstop=4 softtabstop=4
set.shiftwidth=4

set.hlsearch = true  --Switch on search pattern highlighting.
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitright= true
set.splitbelow = true 
set.wrap = false
set.scrolloff = 8
set.fileencoding = 'utf-8'
set.termguicolors = true 
set.cursorline = true

set.relativenumber = true

-- set.colorscheme = NeoSolarized

set.hidden = true
set.ai = true  -- always set autoindenting on
set.si = true
set.wildmenu = true
set.showmatch = true
set.number = true
set.relativenumber = true
set.cmdheight=2 --give more space for displaying messages.
set.smartindent = true
set.undofile = true
set.ruler = true
set.ignorecase = true 
set.mouse=a
set.clipboard=unnamed,unnamedplus -- set clipboard to universal for easy copy/paste to diff apps 
set.completeopt=menuone,noinsert,noselect
set.showmatch = true
set.hidden = true  --This option allows you to switch between multiple buffers without saving a changed buffer
set.mousehide = true  --Hide the mouse pointer while typing.

-- Undo and backup options
set.backup = false
set.writebackup = false
set.undofile = true
set.swapfile = false
