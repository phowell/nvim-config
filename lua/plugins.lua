-- I'm using Packer for package management
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Gruvbox 4 Life
	use 'sainnhe/gruvbox-material'
	use 'lifepillar/vim-gruvbox8'

	-- Sometimes I have to write things that aren't code
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'

    -- Other pretty stuff
    use {'kyazdani42/nvim-web-devicons', as ='devicons'}

    -- Language specific plugins
    use 'rust-lang/rust.vim'
	use 'euclidianAce/BetterLua.vim'

    -- LSP is a thing
    use 'neovim/nvim-lspconfig'
    use 'tjdevries/lsp_extensions.nvim'
    use 'nvim-lua/completion-nvim'
	use 'nvim-lua/lsp-status.nvim'
    use 'norcalli/snippets.nvim'

    -- Treesitter is nice
    use {'nvim-treesitter/nvim-treesitter', as ='treesitter', run = ':TSUpdate'}
    use {'p00f/nvim-ts-rainbow', requires = 'treesitter'}

	-- Some nice quality of life and fun stuff
    use 'jeffkreeftmeijer/vim-numbertoggle'
	use 'jiangmiao/auto-pairs'
	use {'lukas-reineke/indent-blankline.nvim', branch='lua'}
	use 'ThePrimeagen/vim-be-good'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

--[[
    -- Trying out a new status line
    use {'hoob3rt/lualine.nvim',
        requires = {'devicons'},
		config = function()
			local lualine = require('lualine')
			lualine.theme = 'gruvbox'
			lualine.status()
		end
    }
--]]

	-- Trying out Galaxyline
	use {'glepnir/galaxyline.nvim',
		branch='main',
		requires = 'devicons'
	}
end)
