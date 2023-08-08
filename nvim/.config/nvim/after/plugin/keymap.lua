local Remap = require("zejr.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

scripts = require("zejr.scripts")

nmap("<F3>",":noh<CR>")
nmap("<F8>",":TagbarToggle<CR>")
nmap("<F6>","<Plug>MarkdownPreview")
nmap("<F7>","<Plug>MarkdownPreviewStop")
nmap("<M-p>","<Plug>MarkdownPreviewToggle")
nnoremap("<leader>to",":NvimTreeToggle <CR>")
nnoremap("<leader>wa",":wa <cr>")

nnoremap("<C-t>",":ToggleTerm<CR>")

nnoremap("<Tab>",":bn<CR>")
nnoremap("<S-Tab>",":bp<CR>")
nnoremap("m","$")
nnoremap("Z","^")
vnoremap("m","$")
vnoremap("Z","^")
nnoremap("J",":m .+1<CR>==")
nnoremap("K",":m .-2<CR>==")
vnoremap("J",":m '>+1<CR>gv=gv")
vnoremap("K",":m '<-1<CR>gv=gv")
nnoremap("tt",":t.<CR>")
vnoremap("tt",":t.<CR>")

nnoremap("<leader>?",":LvimHelper<CR>")
nnoremap("<leader>e","viw")
nmap("<leader><Enter>","!!zsh<CR>")
nmap('<Home>',':TroubleToggle<CR>')
-- nmap("<leader>'","ysiw'")

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

-- nnoremap("<leader>b",":Git blame<cr>")
nnoremap("<leader>q",":qa <cr>")
nnoremap("<leader>Q",":qa! <cr>")
nnoremap("<leader>x",":bd <cr>")
nnoremap("<leader>,",":!ctags -R .<CR>")
nnoremap("+",":vertical resize +5<CR>==")
nnoremap("-",":vertical resize -5<CR>==")
nnoremap("<leader>rp",":resize 100<CR>")
nnoremap("<leader>y",'"+y')
vnoremap("<leader>y",'"+y')
nnoremap("<leader>p", '"*p')
nnoremap("<leader>Y","y$")
vnoremap("<leader>d","\"_d")
nnoremap("dd","\"_dd")
vnoremap("<leader>r",":'<,'>!python3<CR>")

nnoremap("n","nzzzv")
nnoremap("N","Nzzzv")

nnoremap("cc",":Commentary <CR>")

vnoremap('"', 's"<ESC>pa"<ESC>')
vnoremap("'", "s'<ESC>pa'<ESC>")
vnoremap("(", "s(<ESC>pa)<ESC>")
vnoremap("[", "s[<ESC>pa]<ESC>")
vnoremap("{", "s{<ESC>pa}<ESC>")


nnoremap("<leader>h", "<c-w>h")
nnoremap("<leader>j", "<c-w>j")
nnoremap("<leader>k", "<c-w>k")
nnoremap("<leader>l", "<c-w>l")

inoremap("/", "/\v")
vnoremap("<", "<gv")
vnoremap(">", ">gv")
xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap("<leader>u", ":UndotreeToggle<CR>")
nnoremap("U", "<C-r>")

nnoremap("<leader>v", function() scripts.select_inner_chars("s") end)
nnoremap("<leader>vc", function() scripts.select_inner_chars("c") end)
