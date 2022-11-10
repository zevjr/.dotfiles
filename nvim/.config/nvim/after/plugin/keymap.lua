local Remap = require("zejr.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nmap("<F3>",":noh<CR>")
nmap("<F8>",":TagbarToggle<CR>")
nmap("<F6>","<Plug>MarkdownPreview")
nmap("<F7>","<Plug>MarkdownPreviewStop")
nmap("<M-p>","<Plug>MarkdownPreviewToggle")

nnoremap("<C-t>",":ToggleTerm<CR>")

nnoremap("<Tab>",":bn<CR>")
nnoremap("<S-Tab>",":bp<CR>")
nnoremap("m","$")
nnoremap("z","^")
vnoremap("m","$")
vnoremap("z","^")
nnoremap("J",":m .+1<CR>==")
nnoremap("K",":m .-2<CR>==")
vnoremap("J",":m '>+1<CR>gv=gv")
vnoremap("K",":m '<-2<CR>gv=gv")
nnoremap("tt",":t.<CR>")
vnoremap("tt",":t.<CR>")

nnoremap("<leader>?",":LvimHelper<CR>")
nnoremap("<leader>e","viw")
nmap("<leader><Enter>","!!zsh<CR>")
nmap('<Home>',':TroubleToggle<CR>')
-- nmap("<leader>'","ysiw'")

nnoremap("<S-F3>",":NvimTreeToggle <CR>")
nnoremap("<leader>i",":Isort <CR>")
nnoremap("<leader>I",":Black <CR>")


nnoremap("Q","<nop>")
nnoremap("<Right>","<nop>")
nnoremap("<Left>","<nop>")
nnoremap("<Up>","<nop>")
nnoremap("<Down>","<nop>")
vnoremap("<Right>","<nop>")
vnoremap("<Left>","<nop>")
vnoremap("<Up>","<nop>")
vnoremap("<Down>","<nop>")
nnoremap("<C-z>","<nop>")

nnoremap("<leader>v",":BufstopFast<cr>")
nnoremap("<leader>V",":Bufstop<cr>")
-- nnoremap("<leader>b",":Git blame<cr>")
nnoremap("<leader>d","dd")
nnoremap("<S-F4>",":wa <cr>")
nnoremap("<leader>q",":qa <cr>")
nnoremap("<leader>Q",":qa! <cr>")
nnoremap("<leader>x",":bd <cr>")
nnoremap("<leader>,",":!ctags -R .<CR>")
nnoremap("<leader>+",":vertical resize +5<CR>")
nnoremap("<leader>-",":vertical resize -5<CR>")
nnoremap("<leader>rp",":resize 100<CR>")
nnoremap("<leader>y",'"+y')
vnoremap("<leader>y",'"+y')
nnoremap("<leader>p", '"*p')
nnoremap("<leader>Y","y$")
nnoremap("<leader>d",'"_d')
vnoremap("<leader>r",":'<,'>!python3<CR>")

nnoremap("n","nzzzv")
nnoremap("N","Nzzzv")

nnoremap("cc",":Commentary <CR>")

