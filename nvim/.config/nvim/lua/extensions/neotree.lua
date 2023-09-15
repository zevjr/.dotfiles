local neotree = require("neo-tree")

neotree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    use_libuv_file_watcher=true,
    name = {
        trailing_slash = true,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName"
    },
    window = {
        width = 30,
        mappings = {
            ["<cr>"] = "open",
            ["-"] = "open_split",
            ["|"] = "open_vsplit",
        },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        never_show = { "__pycache__", "node_modules", ".cache", ".DS_Store" },
      },
      follow_current_file = {
          enable = true,
          leave_dirs_open = true,
      }
    }
})
