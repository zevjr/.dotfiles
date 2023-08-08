-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  -- on_attach = on_attach,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  renderer = {
    group_empty = true,
    add_trailing = true,
    highlight_git = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = true,
    },
    open_file = {
      quit_on_open = true,
    },
  },
})
