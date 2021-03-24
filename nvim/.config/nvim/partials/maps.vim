" Move and center screen
nnoremap G Gzz
nnoremap n nzz

" Esc with jj
inoremap jj <Esc>

" Base64 decode/encode
vnoremap <leader>64d c<c-r>=system('base64 --decode', @")<cr><esc>
vnoremap <leader>64e c<c-r>=system('base64', @")<cr><esc>

" Set unset wrap
nmap <leader>m :set wrap!<CR>zz

" Open in new tab fullscreen
nmap gaz :tab split<CR>

" Edit/reload vimrc
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" Fast save and close
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>
nmap <leader>q :q<CR>

" insert blank line before current line without leaving insert mode
imap <leader>o <c-o><s-o>

" Fix indentation
nnoremap <leader>i gg=G``zz<CR>

" Turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" Terminal maps
tnoremap jj <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Delete previous character with backspace in normal mode
noremap <BS> hx

" Close buffer
noremap <leader>c :Bclose <CR>

" Resize splits
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Open in new tab
nmap tb :tabclose<CR>
function! OpenCurrentAsNewTab()
    let l:currentPos = getcurpos()
    tabedit %
    call setpos(".", l:currentPos)
endfunction
nmap tt :call OpenCurrentAsNewTab()<CR>

