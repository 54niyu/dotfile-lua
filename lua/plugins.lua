-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use {"hrsh7th/vim-vsnip"}
  use {"hrsh7th/vim-vsnip-integ"}
  use {"rafamadriz/friendly-snippets"}
  use 'windwp/nvim-autopairs'
  use 'andymass/vim-matchup'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'
  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'romgrk/nvim-treesitter-context'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use 'famiu/feline.nvim'

  -- Which key
  use {"folke/which-key.nvim"}

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'fhill2/telescope-ultisnips.nvim'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Color
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'sindrets/diffview.nvim'
  use { 'TimUntersberger/neogit', requires = "nvim-lua/plenary.nvim"}

  use {"kevinhwang91/nvim-bqf"}

  -- Move & Search & replace
  use 'windwp/nvim-spectre'
  use 'kevinhwang91/nvim-hlslens'
  use 'kshenoy/vim-signature'

  -- Colorschema
  use 'sainnhe/gruvbox-material'

  -- General Plugins
  use 'airblade/vim-rooter'
  use 'numtostr/FTerm.nvim'
  use {"akinsho/nvim-toggleterm.lua"}
  use 'folke/todo-comments.nvim'
  use {"terrortylor/nvim-comment"}
  use {'edluffy/specs.nvim'}
  use {'ray-x/go.nvim'}
  use {'54niyu/nvim-lint' }
  use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {"glepnir/galaxyline.nvim"}
end)
