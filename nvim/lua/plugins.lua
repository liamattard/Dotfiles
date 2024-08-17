vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	use("mbbill/undotree")

	--use({
	--	"goolord/alpha-nvim",
	--	config = function()
	--		require("alpha").setup(require("alpha.themes.dashboard").config)
	--	end,
	--})

	use("elihunter173/dirbuf.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("lewis6991/gitsigns.nvim")

	use("folke/tokyonight.nvim")

	use({
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	})

	-- LSP

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},

		use("mfussenegger/nvim-dap"),
		use("jay-babu/mason-nvim-dap.nvim"),

		use({
			"aserowy/tmux.nvim",
		}),
	})
end)
