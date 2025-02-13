
g.db_ui_use_nerd_fonts = 1

-- cmd[[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]

local function db_completion()
  require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
end

g.db_ui_save_location = vim.fn.expand("~/.config/dadbod")

g.db_ui_table_helpers = {
  postgresql = {
    Count = 'select count(*) from "{table}"',
  },
}

api.nvim_create_autocmd("FileType",{
  pattern={
    "sql",
  },
  command=[[setlocal omifunc=vim_dadbod_completion#omni]],
})

api.nvim_create_autocmd("FileType",{
  pattern={
    "sql",
    "plsql",
  },
  callback=function ()
    vim.schedule(db_completion)
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dbui" },
  callback = function()
    vim.keymap.set({ "n", "x" }, "<C-Space>", "<Plug>(DBUI_ExecuteQuery)")
  end,
})


