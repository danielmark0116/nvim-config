
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
    m = {
      "<cmd>:MaximizerToggle<cr>", "Toggle split window maximizer"
    },
    j = {
      name = "Jest",
      j = {"<cmd>:JestSingle<cr>", "Run current (based on cursor position) test"},
      f = {"<cmd>:JestFile<cr>", "Run current test suite file tests"},
      -- l = {"<cmd>:TestLast<cr>", "Run last test(s)"},
    },
    f = {
      name = "Files",
      f = { "<cmd>Telescope git_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      s = { "<cmd>Telescope live_grep<cr>", "Search by words" },
      c = { "<cmd>Telescope grep_string<cr>", "Search by current word under the cursor" },
      n = { "<cmd>enew<cr>", "New File" },
      e = { "<cmd>:Explore<cr>", "Explore" },
      t = { "<cmd>:TodoTelescope<cr>", "Todo telescope" },
      l = { "<cmd>:TodoLocList<cr>", "Todo list" },
    },
    b = {
      name = "Buffer",
      j = {"<cmd>:BufferPick<cr>", "Jump to buffer"},
      l = {"<cmd>:BufferNext<cr>", "Cycle Next"},
      h = {"<cmd>:BufferPrevious<cr>", "Cycle Prev"},
      H = {"<cmd>:BufferCloseBuffersLeft<cr>", "Close all to the left"},
      L = {"<cmd>:BufferCloseBuffersRight<cr>", "Close all to the right"},
      c = {"<cmd>:BufferClose!<cr>", "Close current buffer"},
      a = {"<cmd>:BufferCloseAllButCurrent<cr>", "Close all buffer but the current one"},
      p = {"<cmd>:BufferPin<cr>", "Pin / unpin buffer"}
    },
    c = {
      name = "ChatGPT",
        c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
        g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
        t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
        k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
        d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
        a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
        o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
        s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
        f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
        x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
        r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
        l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
      },
  },
})
EOF

" COMMENTER
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

" Chat GPT
lua << EOF
require'chatgpt'.setup{
   openai_params = {
        model = "gpt-4",
   }
}
EOF

" ELIXIR LS
lua << EOF
require'nvim-jest'.setup {
  -- Jest executable
  -- By default finds jest in the relative project directory
  -- To override with an npm script, provide 'npm test --' or similar
  jest_cmd = 'npm run jest --',

  -- Prevents tests from printing messages
  silent = false,
}
EOF

" TODO comments
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF


" ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'tsx': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'tsx': ['prettier', 'eslint'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
