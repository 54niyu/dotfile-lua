-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

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
        auto_clean = true,
    },
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile 
  augroup end
]])

return packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use("wbthomason/packer.nvim")

    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use({
        "onsails/lspkind-nvim",
        config = function()
            require("plugins.lspkind")()
        end,
    })
    use({
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins.vim-signature")()
        end,
    })

    -- Autocomplete
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.nvim-cmp")()
        end,
    })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-calc")
    use({ "ray-x/cmp-treesitter" })

    -- Snippet
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
    use('hrsh7th/vim-vsnip-integ')
    use('rafamadriz/friendly-snippets')

    -- Tabnine
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


    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter")()
        end,
    })
    use("nvim-treesitter/nvim-treesitter-context")
    use({
        "p00f/nvim-ts-rainbow",
        config = function()
            require("plugins.nvim-ts-rainbow")()
        end,
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent-blankline")()
        end,
    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.nvim-autopairs")()
        end,
    })
    use("andymass/vim-matchup")

    -- Icons
    use("kyazdani42/nvim-web-devicons")
    use("ryanoasis/vim-devicons")

    -- Status Line and Bufferline
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup()
        end,
    })

    -- Which key
    use({
        "folke/which-key.nvim",
        config = function()
            require("plugins.which-key")()
        end,
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.telescope")()
        end,
    })
    use("nvim-telescope/telescope-fzy-native.nvim")
    use({
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                silent_chdir = false,
                manual_mode = true,
            })
        end,
    })

    -- Explorer
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.nvimtree")()
        end,
    })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.gitsigns")()
        end,
    })
    use({
        "sindrets/diffview.nvim",
        opt = true,
        cmd = "DiffviewOpen",
        config = function()
            require("plugins.diffview")()
        end,
    })
    use({
        "TimUntersberger/neogit",
        opt = true,
        requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        cmd = { "Neogit" },
    })

    -- Quickfix
    use({
        "kevinhwang91/nvim-bqf",
        config = function()
            require("plugins.bqf")()
        end,
    })

    -- Move & Search & replace
    use({
        "windwp/nvim-spectre",
        config = function()
            require("plugins.nvim-spectre")()
        end,
    })
    use({
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("plugins.hlslens")()
        end,
    })

    -- Colorschema
    -- use("sainnhe/gruvbox-material")
    use("navarasu/onedark.nvim")
    use("folke/tokyonight.nvim")

    use({
        "terrortylor/nvim-comment",
        config = function()
            require("plugins.nvim-comment")()
        end,
    })
    use({
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
    })

    -- Term
    use({
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugins.toggleterm")()
        end,
    })

    use({
        "mhartington/formatter.nvim",
        config = function()
            require("plugins.formatter")()
        end,
    })

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
            require("plugins.nvim-lint")()
        end,
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        ft = { "markdown", "md" },
        cmd = "MarkdownPreview",
    })

    use {
        "nvim-neorg/neorg",
        ft = "norg",
        after = "nvim-treesitter",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.concealer"] = {},
                    ["core.norg.completion"] = {
                        config = {
                            engine = 'nvim-cmp',
                        }
                    },
                }
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }

    -- use({
    -- 	"jose-elias-alvarez/null-ls.nvim",
    -- 	config = function()
    -- 		require("plugins.null-ls")()
    -- 	end,
    -- 	requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    -- })
end)
