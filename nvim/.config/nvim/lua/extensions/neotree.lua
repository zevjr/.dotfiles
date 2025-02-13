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
            ['Y'] = function(state)
              -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
              -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
              local node = state.tree:get_node()
              local filepath = node:get_id()
              local filename = node.name
              local modify = fn.fnamemodify

              local results = {
                filepath,
                modify(filepath, ':.'),
                modify(filepath, ':~'),
                filename,
                modify(filename, ':r'),
                modify(filename, ':e'),
              }

              -- absolute path to clipboard
              local i = fn.inputlist({
                'Choose to copy to clipboard:',
                '1. Absolute path: ' .. results[1],
                '2. Path relative to CWD: ' .. results[2],
                '3. Path relative to HOME: ' .. results[3],
                '4. Filename: ' .. results[4],
                '5. Filename without extension: ' .. results[5],
                '6. Extension of the filename: ' .. results[6],
              })

              if i > 0 then
                local result = results[i]
                if not result then
                  return print('Invalid choice: ' .. i)
                end
                fn.setreg('+', result)
                print('Copied to clipboard: ' .. result)
              end
            end
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
