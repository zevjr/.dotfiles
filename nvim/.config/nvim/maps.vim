let mapleader = " "

map <F8> :TagbarToggle<CR>
nmap <F6> <Plug>MarkdownPreview
nmap <F7> <Plug>MarkdownPreviewStop
nmap <M-p> <Plug>MarkdownPreviewToggle
map <C-f> :Ag<CR>
map <C-p> :Rg<CR>

nnoremap <C-b> :Gblame<cr>
nnoremap <C-\> :CocCommand explorer <CR>
nnoremap <C-i> :Isort <CR>
nnoremap <C-I> <cmd>call Black()<CR>

nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>t :t.<cr>
nnoremap <leader>d dd
nnoremap <leader>s :w! <cr>
nnoremap <leader>S :wa <cr>
nnoremap <leader>q :q <cr>
nnoremap <leader>x :bp \|bd #<cr>
nnoremap <leader>, :!ctags -R .<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
nnoremap <leader>y "+y
nnoremap <leader>p "*p
nnoremap <leader>Y y$
nnoremap <leader>d "_d
vnoremap <leader>r :'<,'>!python3<CR>

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap cc :Commentary <CR>
