
" See plugin/bufkill.vim
" use emacs keybind
" nmap <C-x>k :BD<CR>
" nmap <leader>bcc :bd<CR>
"Write buffer (save)
" nnoremap <C-s> :<C-u>write<CR>
"yank to end
nnoremap Y y$
" Whitespace jump (see plugin/whitespace.vim)
nnoremap ]w :<C-u>WhitespaceNext<CR>
nnoremap [w :<C-u>WhitespacePrev<CR>
" Remove spaces at the end of lines
nnoremap <silent> <Space>cw :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <ESC>^i
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
inoremap kj <Esc>
inoremap jk <Esc>
"insert a newline
inoremap <C-O> <Esc>o
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

" command line alias
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

tnoremap <A-[> <C-\><C-n>

function! s:QuiteVim() abort
  if empty(expand('%:t'))
    execute ":q"
  else
    execute ":wq!"
  endif
endfunction
" Quiet
nnoremap <leader>qq :call <SID>QuiteVim()<CR>
nnoremap <leader>qw <esc>:q!<CR>

"switch window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

" Session management shortcuts (see plugin/sessions.vim)
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" Use <tab> and <S-tab> to navigate completion list: >

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion: >

  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif
" Use <CR> to confirm completion, use: >

  inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
" To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use: >

  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

