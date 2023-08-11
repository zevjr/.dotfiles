-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
require("helpers/globals")

local Remap = require("helpers/keyboard")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

local scripts = require("helpers/scripts")

nmap("<F3>", ":noh<CR>")
nnoremap("<leader>to", ":Neotree toggle reveal <CR>")
nnoremap("<leader>n", ":Neotree toggle show buffers right <CR>")
nnoremap("<leader>wa", ":wa <cr>")

nnoremap("<C-t>", ":ToggleTerm<CR>")

nnoremap("<Tab>", ":bn<CR>")
nnoremap("<S-Tab>", ":bp<CR>")
nnoremap("m", "$")
vnoremap("m", "$h")
nnoremap("Z", "^")
vnoremap("Z", "^")
nnoremap("K", ":m .-2<CR>==")
vnoremap("K", ":m '<-1<CR>gv=gv")
nnoremap("J", ":m .+1<CR>==")
vnoremap("J", ":m '>+1<CR>gv=gv")
nnoremap("tt", ":t.<CR>")
vnoremap("tt", ":t.<CR>")

nnoremap("<leader>e", "viw")
nmap("<leader><Enter>", "!!zsh<CR>")
nmap("<Home>", ":TroubleToggle<CR>")

nnoremap("Q", "<nop>")
nnoremap("<Right>", "<nop>")
nnoremap("<Left>", "<nop>")
vnoremap("<Right>", "<nop>")
vnoremap("<Left>", "<nop>")
vnoremap("<Up>", "<nop>")
vnoremap("<Down>", "<nop>")
nnoremap("<C-z>", "<nop>")

nnoremap("<leader>q", ":qa <cr>")
nnoremap("<leader>Q", ":qa! <cr>")
nnoremap("<leader>x", ":bd <cr>")
nnoremap("+", ":vertical resize +5<CR>==")
nnoremap("-", ":vertical resize -5<CR>==")
nnoremap("<leader>rp", ":resize 100<CR>")
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", "y$")
nnoremap("p", '"_dP')
vnoremap("p", '"_dP')
nnoremap("dd", '"_dd')
vnoremap("<leader>r", ":'<,'>!python3<CR>")

nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

vnoremap('"', 's"<ESC>pa"<ESC>')
vnoremap("'", "s'<ESC>pa'<ESC>")
vnoremap("(", "s(<ESC>pa)<ESC>")
vnoremap("[", "s[<ESC>pa]<ESC>")
vnoremap("{", "s{<ESC>pa}<ESC>")

inoremap('"', '""<left>')
inoremap("'", "''<left>")
inoremap("(", "()<left>")
inoremap("[", "[]<left>")
inoremap("{", "{}<left>")
inoremap("{<CR>", "{<CR>}<ESC>O<TAB>")
inoremap("{;<CR>", "{<CR>};<ESC>O<TAB>")

nnoremap("<leader>h", "<c-w>h")
nnoremap("<leader>j", "<c-w>j")
nnoremap("<leader>k", "<c-w>k")
nnoremap("<leader>l", "<c-w>l")

vnoremap("<", "<gv")
vnoremap(">", ">gv")
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap("U", "<C-r>")

nnoremap("<leader>v", function()
  scripts.select_inner_chars("s")
end)
nnoremap("<leader>vc", function()
  scripts.select_inner_chars("c")
end)

--[[ Telescope ]]
-- nnoremap("<C-f>", function()
--   require("telescope.builtin").grep_string({
--     search = fn.input("Grep For > "),
--   })
-- end)
nnoremap("<C-p>", function()
  require("telescope.builtin").find_files({
    hidden = true,
  })
end)
