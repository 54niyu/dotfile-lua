-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require("packer").init({ display = { auto_clean = false } })

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use("wbthomason/packer.nvim")

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup()
		end,
	})

	-- Autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-calc")
	use("ray-x/cmp-treesitter")
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
				run_on_every_keystroke = true,
			})
		end,
	})

	use("windwp/nvim-autopairs")

	--"ChristianChiarulli/dashboard-nvim",

	use("andymass/vim-matchup")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use({ "lukas-reineke/indent-blankline.nvim" })
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("romgrk/nvim-treesitter-context")

	-- Icons
	use("kyazdani42/nvim-web-devicons")
	use("ryanoasis/vim-devicons")

	-- Status Line and Bufferline
	use({ "glepnir/galaxyline.nvim" })

	-- Which key
	use({ "folke/which-key.nvim" })

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	-- use("nvim-telescope/telescope-project.nvim")
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
			vim.g.nvim_tree_respect_buf_cwd = 1
		end,
	})

	-- Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
       require("plugins.nvimtree")
		end,
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({
		"sindrets/diffview.nvim",
		opt = true,
		cmd = "DiffviewOpen",
		config = function()
			require("plugins.diffview")
		end,
	})
	use({
		"TimUntersberger/neogit",
		opt = true,
		requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		cmd = { "Neogit" },
	})
	-- Quickfix
	use({ "kevinhwang91/nvim-bqf" })

	-- Move & Search & replace
	use("windwp/nvim-spectre")
	use("kevinhwang91/nvim-hlslens")
	use("kshenoy/vim-signature")

	-- Colorschema
	use("sainnhe/gruvbox-material")
	use("navarasu/onedark.nvim")

	-- General Plugins
	use({ "airblade/vim-rooter", disable = true })
	use({ "terrortylor/nvim-comment" })
	use({ "edluffy/specs.nvim" })
	use({
		"folke/todo-comments.nvim",
		opt = true,
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		opt = true,
		config = function()
			require("trouble").setup({})
		end,
	})

	use({ "folke/tokyonight.nvim" })

	-- Term
	use({ "akinsho/nvim-toggleterm.lua" })

	-- Go
	use({
		"ray-x/go.nvim",
		opt = true,
		ft = "go",
		config = function()
			require("go").setup()
		end,
	})

	-- Lint
	use({
		"mfussenegger/nvim-lint",
		opt = true,
		ft = { "go" },
		config = function()
			require("lint").linters_by_ft = {
				go = { "golangcilint" },
			}
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		ft = { "markdown", "md" },
		cmd = "MarkdownPreview",
	})
end)
