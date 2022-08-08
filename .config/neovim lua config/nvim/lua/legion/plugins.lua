local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

--put plugins here
return require'packer'.startup(function()
   use 'wbthomason/packer.nvim'
   use 'nvim-lualine/lualine.nvim'
   use 'neovim/nvim-lspconfig'
   -- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'jose-elias-alvarez/null-ls.nvim'

	-- Telescope
   use 'overcache/NeoSolarized'
   use 'tpope/vim-commentary'
   use 'tpope/vim-obsession'
   use 'jiangmiao/auto-pairs'
   use 'kyazdani42/nvim-web-devicons'
   use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
   use 'nvim-lua/popup.nvim'
   use 'nvim-lua/plenary.nvim'
   use 'nvim-telescope/telescope.nvim'
   use {
        'Shougo/defx.nvim',
        run = ':UpdateRemotePlugins'
    }
   use 'roxma/nvim-yarp'
   use 'roxma/vim-hug-neovim-rpc'
   use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}


-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
