if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive' " GitHub
Plug 'tpope/vim-rhubarb' " GitHub

if has("nvim")
  " Coc-nvim 
  " It collides with nvim-lsp autocompletes etc, redundant, enabled only for
  " elixir
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install', 'for': ['elixir', 'ex', 'exs']}

  Plug 'tpope/vim-surround'
  Plug 'itchyny/vim-cursorword'
  Plug 'hoob3rt/lualine.nvim' " bottom bar styling with modes info etc
  Plug 'jremmen/vim-ripgrep' " :Rg search
  Plug 'numToStr/Comment.nvim' " Commenting
  Plug 'APZelos/blamer.nvim' " Blame
  Plug 'JoosepAlviste/nvim-ts-context-commentstring' " Additional handling of comments, e.g. in tsx files
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } " File explorer

  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' } " gh + gp -> definitoin previews, jumps, etc
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip' " for snippets?
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " TS, TreeSitter -> syntax highliighting
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim' " adds vscode-like pictograms to neovim built-in lsp, func, module etc

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  Plug 'nvim-telescope/telescope.nvim' " search <leader> ff
  Plug 'windwp/nvim-autopairs'
  Plug 'nvim-lua/completion-nvim'
  Plug 'preservim/nerdtree' " file explorer, sidebar
  Plug 'akinsho/bufferline.nvim'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'folke/which-key.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' },
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons' " Icons
  Plug 'preservim/vimux' " Split window to run a command

  " Elixir
  Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  let g:mix_format_on_save = 1
  Plug 'fishcakez/vim-erlang'
endif

let NERDTreeShowHidden=1
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_path = "/Users/danielgrychtol/.nvm/versions/node/v14.11.0/bin/prettier"
let g:prettier#autoformat_config_present = 1

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

