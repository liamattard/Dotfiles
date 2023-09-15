vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use ({
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
	    requires = { {'nvim-lua/plenary.nvim'} }
    })

    use ( 'nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'} )

end)
