if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'tpope/vim-surround'
  Plug 'itchyny/vim-cursorword'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'numToStr/Comment.nvim' 
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'nvim-lua/completion-nvim'
  Plug 'preservim/nerdtree'
  Plug 'akinsho/bufferline.nvim'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'folke/which-key.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' },
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'


endif

let NERDTreeShowHidden=1
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_path = "/Users/danielgrychtol/.nvm/versions/node/v14.11.0/bin/prettier"
let g:prettier#autoformat_config_present = 1



Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }



call plug#end()

