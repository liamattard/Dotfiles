vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use ({
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
	    requires = { {'nvim-lua/plenary.nvim'} }
    })

    use ( 'nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'} )

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use 'mbbill/undotree'

    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }


    use "elihunter173/dirbuf.nvim"
end)
