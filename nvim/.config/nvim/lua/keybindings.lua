require("helpers/globals")

local Remap = require("helpers/keyboard")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

local scripts = require("helpers/scripts")

nmap("<F10>", ":noh<CR>")
nnoremap("<leader>to", ":Neotree toggle reveal <CR>")
nnoremap("<leader>n", ":Neotree toggle show buffers right <CR>")
nnoremap("<leader>wa", ":wa <cr>")

nnoremap("<C-t>", ":ToggleTerm<CR>")

nnoremap("<Tab>", [[:bn<CR>]])
nnoremap("<S-Tab>", [[:bp<CR>]])
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
nnoremap("<leader>x", ":bufdo bd <cr>")
nnoremap("<leader>xa", ":bufdo %bd | e# <cr>")
nnoremap("+", ":vertical resize +5<CR>==")
nnoremap("-", ":vertical resize -5<CR>==")
nnoremap("<leader>rp", ":resize 100<CR>")
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", "y$")
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
nnoremap("U", "<C-r>")
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap("<leader>gb", [[:Gitsigns toggle_current_line_blame <cr>]])

nnoremap("<leader>f", [[<cmd>lua vim.lsp.buf.format() <cr>]])

-- vnoremap("<leader>f", [[<cmd>lua vim.lsp.buf.range_formatting() <cr>]])
-- vnoremap("<leader>f", function()
--   vim.lsp.buf.format({
--     async = true,
--     range = {
--       ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
--       ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
--     }
--   })
-- end)

function FormatFunction()
  vim.lsp.buf.format({
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    }
  })
end
vnoremap('<leader>f', "<Esc><cmd>lua FormatFunction()<cr>")

nnoremap("<leader>v", function()
  scripts.select_inner_chars("s")
end)
nnoremap("<leader>vc", function()
  scripts.select_inner_chars("c")
end)

--[[ Telescope ]]
nnoremap("<C-f>", function()
  require("telescope.builtin").grep_string({
    search = fn.input("Grep For > "),
  })
end)
nnoremap("<C-p>", function()
  require("telescope.builtin").find_files({
    hidden = true,
  })
end)

nnoremap("rep", [[:%s/"https:\/\/sqs.us-eas.*"/""/g <CR>}]])

nnoremap("<leader>di", ':lua require("dap").toggle_breakpoint()<CR>')
nnoremap("<leader>ds", ':lua require("dap").continue()<CR>')
nnoremap("<leader>dl", ':lua require("dap").run_to_cursor()<CR>')
nnoremap("<leader>dS", ':lua require("dap").disconnect()<CR>')
nnoremap("<leader>dww", ':lua require("dapui").toggle()<CR>')
vnoremap("<leader>k", ':lua require("dapui").eval()<CR>')
