local M = {}

local function select_inner_chars()
    local r,c = unpack(vim.api.nvim_win_get_cursor(0))
    local linetext = vim.api.nvim_get_current_line()
    local char = string.sub(linetext, c + 1, c + 1)
    vim.api.nvim_feedkeys("vi" .. char, "n", true)
end


M.select_inner_chars = select_inner_chars()

return M

