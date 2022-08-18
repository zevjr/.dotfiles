require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "_", action = "hsplit" },
        { key = "|", action = "vsplit" },
      },
    },
  },
  renderer = {
    group_empty = true,
    add_trailing = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
