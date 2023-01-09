
" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab

set mouse=a

set guifont=DroidSansMono_Nerd_Font:h11

" Git Blame config
let g:blamer_enabled = 1

" Nvim TEST
let test#strategy = "vimux"

"let loaded_matchparen = 1
"set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

filetype plugin on

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" JavaScript
au BufNewFile,BufRead *.jsx setf javascriptreact
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
 "  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/onedark.vim
  "colorscheme onedark
  colorscheme dracula
endif

"}}}

" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:
"
"
" WHICH KEY

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    g = {
      "<cmd>:G<cr>", "Git"
    },
    j = {
      name = "Jest",
      j = {"<cmd>:TestNearest<cr>", "Run current (based on cursor position) test"},
      f = {"<cmd>:TestFile<cr>", "Run current test suite file tests"},
      l = {"<cmd>:TestLast<cr>", "Run last test(s)"},
    },
    f = {
      name = "Files",
      f = { "<cmd>Telescope git_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
      e = { "<cmd>:Explore<cr>", "Explore" },
    },
    b = {
      name = "Buffer",
      j = {"<cmd>:BufferPick<cr>", "Jump to buffer"},
      l = {"<cmd>:BufferNext<cr>", "Cycle Next"},
      h = {"<cmd>:BufferPrevious<cr>", "Cycle Prev"},
      H = {"<cmd>:BufferCloseBuffersLeft<cr>", "Close all to the left"},
      L = {"<cmd>:BufferCloseBuffersRight<cr>", "Close all to the right"},
      c = {"<cmd>:BufferClose<cr>", "Close current buffer"},
      a = {"<cmd>:BufferCloseAllButCurrent<cr>", "Close all buffer but the current one"},
      p = {"<cmd>:BufferPin<cr>", "Pin / unpin buffer"}
    }

  },
})
EOF

" COMMETNER
lua << EOF

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

EOF

" ELIXIR LS
lua << EOF
require'lspconfig'.elixirls.setup{
  cmd = { "/Users/danielgrychtol/.config/nvim/elixir-ls/language_server.sh" };
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
}
EOF
