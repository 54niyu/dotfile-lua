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

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use {"hrsh7th/vim-vsnip"}
  use {"hrsh7th/vim-vsnip-integ"}
  use {"rafamadriz/friendly-snippets"}
  use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}
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
  use {"glepnir/galaxyline.nvim"}

  -- Which key
  use {"folke/which-key.nvim"}

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-project.nvim'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'sindrets/diffview.nvim'
  use { 'TimUntersberger/neogit', requires = {"nvim-lua/plenary.nvim","sindrets/diffview.nvim"} }
 
  -- Quickfix
  use {"kevinhwang91/nvim-bqf"}

  -- Move & Search & replace
  use 'windwp/nvim-spectre'
  use 'kevinhwang91/nvim-hlslens'
  use 'kshenoy/vim-signature'

  -- Colorschema
  use 'sainnhe/gruvbox-material'

  -- General Plugins
  use {'airblade/vim-rooter', disable = true}
  use {"terrortylor/nvim-comment"}
  use {'edluffy/specs.nvim'}
  use 'folke/todo-comments.nvim'
  use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- Term
  use {"akinsho/nvim-toggleterm.lua"}

  -- Go
  use {'ray-x/go.nvim'}

  -- Lint
  use {'54niyu/nvim-lint' }

  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = {'markdown', 'md'}}
end)
