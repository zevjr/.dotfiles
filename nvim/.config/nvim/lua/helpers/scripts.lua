scripts = {}

function scripts.select_inner_chars(op)
    local r,c = unpack(api.nvim_win_get_cursor(0))
    local linetext = api.nvim_get_current_line()
    local char = string.sub(linetext, c + 1, c + 1)
    if (op == "s") then
        api.nvim_feedkeys("vi" .. char, "n", true)
    end
    if (op == "c") then
        api.nvim_feedkeys("ci" .. char, "n", true)
    end
end

return scripts