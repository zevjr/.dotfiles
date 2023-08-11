return {
  {
    "nvim-telescope/telescope.nvim",
    -- replace all Telescope keymaps with only one mapping
    keys = function()
      return {
        {
          "<C-f>",
          function()
            require("telescope.builtin").grep_string({ search = fn.input("Grep For > ") })
          end,
        },
      }
    end,
  },
}
