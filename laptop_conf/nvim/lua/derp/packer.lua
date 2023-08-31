local u = require 'derp.utils'
--------------------
-- Plugins config --
--------------------

-- Bootstrap packer.
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Setup before plugins are loaded.
vim.g.ale_disable_lsp = 1

-- Load different plugins.
return require 'packer'.startup( { function(use)

    -- Package manager.
    use 'wbthomason/packer.nvim'

    -- Lua packages.
    use_rocks 'lua-cjson'

    -- Telecope.
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        }
    }


    -- General UI.
    use 'nvim-tree/nvim-web-devicons' -- A bunch of plugins uses this.
    use 'j-hui/fidget.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'rcarriga/nvim-notify'
    use {
      'nvim-lualine/lualine.nvim',
    --  require('lualine').setup() ,
      requires = "nvim-tree/nvim-web-devicons", opt = true,
    }
    -- use 'glepnir/dashboard-nvim'
    use 'AlexvZyl/dashboard-nvim'
    use {
        'romgrk/barbar.nvim',
        requires = "nvim-tree/nvim-web-devicons",
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    }
    -- TODO
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- Programming experience.
    -- TODO
    use 'lukas-reineke/indent-blankline.nvim'
    use 'mg979/vim-visual-multi'
    use 'RRethy/vim-illuminate'
    use 'windwp/nvim-autopairs'
    use 'preservim/nerdcommenter'
    use 'tpope/vim-commentary'
    use 'brooth/far.vim'
    use {
        'ggandor/leap.nvim',
        requires = {
            'tpope/vim-repeat'
        }
    }

    -- Git.
    -- TODO
    use 'lewis6991/gitsigns.nvim'
    use 'sindrets/diffview.nvim'
    use 'akinsho/git-conflict.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'ThePrimeagen/git-worktree.nvim'

    -- Neovim helpers.
    use 'folke/which-key.nvim'
    use 'sudormrfbin/cheatsheet.nvim'

    -- Filesystem.
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
      config = function()
        require("nvim-tree").setup {}
	end
    }

    -- General language.
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/playground'
        },
        run = ':TSUpdate'
    }
    use 'neovim/nvim-lspconfig'
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
    }
    use {
        'L3MON4D3/LuaSnip',
        requires = {
            'saadparwaiz1/cmp_luasnip'
        }
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-omni',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    }

    -- Language specific.
    use 'JuliaEditorSupport/julia-vim'
    use 'lervag/vimtex'

    -- Fun.
    use 'eandrju/cellular-automaton.nvim'

    -- Theme using.
    use {
       'shaunsingh/nord.nvim',
       branch = 'main'
    }

    -- List of nice themes:
    --------------------------------------
    use 'morhetz/gruvbox'
    use 'sainnhe/gruvbox-material'
    use 'EdenEast/nightfox.nvim'
    use 'catppuccin/nvim'
    use 'folke/tokyonight.nvim'
    -- use 'sainnhe/everforest'
    -- use 'sainnhe/edge'
    use 'shaunsingh/nord.nvim'
    use 'dracula/vim'
    use 'joshdick/onedark.vim'
    -- use 'sam4llis/nvim-tundra'
    use 'rebelot/kanagawa.nvim'
    -- use 'cocopon/iceberg.vim'
    use 'marko-cerovac/material.nvim'
    -- use 'sainnhe/sonokai'
    ----------------------------------------

    -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end

end,

config = {
    display = {
        -- Display packer window as floating.
        open_fn = function ()
            return require 'packer.util'.float { border = 'rounded' }
        end
    }
}

})
