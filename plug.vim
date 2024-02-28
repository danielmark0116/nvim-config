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
  " Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install', 'for': ['javascript', 'javascriptreact']}
  " Copilot
  Plug 'github/copilot.vim', { 'tag': 'v1.12.0' }
  " ChatGPT plug
  Plug 'jackMort/ChatGPT.nvim'
  " NUI is needed for ChatGPT
  Plug 'MunifTanjim/nui.nvim'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'itchyny/vim-cursorword'
  Plug 'hoob3rt/lualine.nvim' " bottom bar styling with modes info etc
  Plug 'jremmen/vim-ripgrep' " :Rg search
  Plug 'APZelos/blamer.nvim' " Blame
  Plug 'JoosepAlviste/nvim-ts-context-commentstring', { 'branch': 'fix-top-level-jsx-commenting' } " Additional handling of comments, e.g. in tsx files
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'tag': '1.5', 'do': ':UpdateRemotePlugins' } " File explorer

  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

  Plug 'neovim/nvim-lspconfig'
  " gh + gp -> definition previews
  Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' } 
  " Using old branch as the new version had breaking changes, did not manage
  " to address it yet in my config
  "Plug 'https://github.com/glepnir/lspsaga.nvim/tree/e844575150d906e64fe9abfac864a5b12f5abe19'
  Plug 'folke/lsp-colors.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'

  " Plug 'David-Kunz/jester' " Running jest test from within the cursors position
  " Choose one, and delete one remaining TODO!
  Plug 'mattkubej/jest.nvim'
  Plug 'vim-test/vim-test'

  Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'v0.8.5', 'do': ':TSUpdate' } " TS, TreeSitter -> syntax highliighting
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'nvim-tree/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim', { 'tag': 'v1.4.1' }
  Plug 'onsails/lspkind-nvim' " adds vscode-like pictograms to neovim built-in lsp, func, module etc

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' } " search <leader> ff
  Plug 'windwp/nvim-autopairs'
  Plug 'nvim-lua/completion-nvim'
  Plug 'preservim/nerdtree', { 'tag': '6.10.16' } " file explorer, sidebar
  " Plug 'akinsho/bufferline.nvim' " replaced with barbar
  Plug 'folke/which-key.nvim', { 'tag': 'v1.4.0' }
  Plug 'dracula/vim', { 'as': 'dracula' },
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons' " Icons
  Plug 'preservim/vimux' " Split window to run a command

  " ALE for eslint and prettier
  Plug 'dense-analysis/ale'

  " Styled-components
  Plug 'styled-components/vim-styled-components'

  " easymotion
  Plug 'easymotion/vim-easymotion'

  " Replace with register
  Plug 'inkarkat/vim-ReplaceWithRegister'

  " Split windows maximizer
  Plug 'szw/vim-maximizer'

  " TODO comments
  Plug 'folke/todo-comments.nvim'

  " Elixir
  " Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  let g:mix_format_on_save = 1
  Plug 'fishcakez/vim-erlang'
endif

let NERDTreeShowHidden=1
let g:prettier#autoformat_config_present = 1
" let g:prettier#exec_cmd_path = "/Users/danielgrychtol/.nvm/versions/node/v14.11.0/bin/prettier"

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

