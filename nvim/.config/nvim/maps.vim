let mapleader = " "

map <F3> :noh<CR>
map <F8> :TagbarToggle<CR>
nmap <F6> <Plug>MarkdownPreview
nmap <F7> <Plug>MarkdownPreviewStop
nmap <M-p> <Plug>MarkdownPreviewToggle

nnoremap <C-t> :ToggleTerm<CR>

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
noremap m $
noremap z ^
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
inoremap J <Esc>:m .+1<CR>==gi
inoremap K <Esc>:m .-2<CR>==gi
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <silent> tt :t.<CR>
vnoremap <silent> tt :t.<CR>

nnoremap <silent> <leader>? :LvimHelper<CR>
nnoremap <silent> <leader>p :Rg<CR>
nnoremap <silent> <leader>f :Ag<CR>
nnoremap <silent> <leader>e viw
nmap <leader><Enter> !!zsh<CR>
nmap <leader>( ysiw(
nmap <leader>[ ysiw[
nmap <leader>{ ysiw{
nmap <leader>" ysiw"
nmap <leader>' ysiw'

nnoremap <silent> <leader>\ :NERDTreeFind <CR>
nnoremap <silent> <leader>i :Isort <CR>
nnoremap <silent> <leader>I :Black <CR>


nnoremap <silent> Q <nop>
nnoremap <silent> <Right> <nop>
nnoremap <silent> <Left> <nop>
nnoremap <silent> <Up> <nop>
nnoremap <silent> <Down> <nop>
vnoremap <silent> <Right> <nop>
vnoremap <silent> <Left> <nop>
vnoremap <silent> <Up> <nop>
vnoremap <silent> <Down> <nop>
nnoremap <silent> <C-z> <nop>

nnoremap <leader>v :BufstopFast<cr>
nnoremap <leader>V :Bufstop<cr>
nnoremap <leader>b :Git blame<cr>
nnoremap <leader>d dd
nnoremap <leader>w :w! <cr>
nnoremap <leader>W :wa <cr>
nnoremap <leader>q :q <cr>
nnoremap <leader>x :bp \|bd #<cr>
nnoremap <leader>, :!ctags -R .<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" nnoremap <leader>p "*p
nnoremap <leader>Y y$
nnoremap <leader>d "_d
vnoremap <leader>r :'<,'>!python3<CR>

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap cc :Commentary <CR>

" HARPOON
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent><leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent><leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent><leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <silent><leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>


" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

