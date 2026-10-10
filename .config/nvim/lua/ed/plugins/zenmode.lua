return {
  "folke/zen-mode.nvim",
  config = function()
    local zen_mode = require("zen-mode")

    zen_mode.setup({})

    vim.keymap.set("n", "<leader>zz", function()
      zen_mode.toggle({
        window = {
          width = 90,
          options = { wrap = false, number = true, relativenumber = true },
        },
      })
    end)

    vim.keymap.set("n", "<leader>zZ", function()
      zen_mode.toggle({
        window = {
          width = 80,
          options = { wrap = false, number = false, relativenumber = false, colorcolumn = "" },
        },
      })
    end)
  end,
}
