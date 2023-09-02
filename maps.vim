" Description: Keymaps

"nnoremap <S-C-p> "0p
" Delete without yank
"nnoremap <leader>d "_d
"nnoremap x "_x

" Increment/decrement
"nnoremap + <C-a>
"nnoremap - <C-x>

" nnoremap <SPACE> <Nop>

let mapleader = "\<Space>"

" Delete a word backwards
"nnoremap dw vb"_d

" Undo
nnoremap <leader>u :undo<CR>

" Write / Save
nnoremap <leader>w :w<CR>

" Jump to beginning and end of a line
nmap <leader>l $
nmap <leader>h ^
xmap <leader>l $
xmap <leader>h ^

" Exit insertmode
inoremap jk <ESC>

" Select all
nmap <C-a> gg<S-v>G

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>ef :NERDTreeFind<CR>

" Run command promt with Vimux in a small horizontal split
nmap <leader>C :VimuxPromptCommand<CR>

" Lspsaga finder
nnoremap gh :Lspsaga lsp_finder<CR>
nnoremap gp :Lspsaga peek_definition<CR>


" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>



"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
" nmap <Space> <C-w>w
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
"map sh <C-w>h
"map sk <C-w>k
"map sj <C-w>j
"map sl <C-w>l
" Resize window
"nmap <C-w><left> <C-w><
"nmap <C-w><right> <C-w>>
"nmap <C-w><up> <C-w>+
"nmap <C-w><down> <C-w>-

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap  <C-K> <Plug>(copilot-next)
imap  <C-D> <Plug>(copilot-dismiss)
let g:copilot_no_tab_map = v:true
