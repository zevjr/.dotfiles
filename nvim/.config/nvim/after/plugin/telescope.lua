
local Remap = require("zejr.keymap")
local nnoremap = Remap.nnoremap


-- nnoremap("<C-p>", ":Telescope")
-- nnoremap("<Leader>pf", function()
--     require('telescope.builtin').git_files()
-- end)
-- nnoremap("<C-f>", function()
--     require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})
-- end)
nnoremap("<C-f>", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').find_files({ hidden = true })
end)

nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)
nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)
