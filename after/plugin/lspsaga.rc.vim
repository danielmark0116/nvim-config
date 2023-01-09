if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF

local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

-- saga.init_lsp_saga {
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',
--   border_style = "round",
-- }

EOF
