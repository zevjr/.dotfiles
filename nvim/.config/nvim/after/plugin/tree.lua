require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "_", action = "hsplit" },
        { key = "|", action = "vsplit" },
      },
    },
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
