local M = {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = {
    --require('oil').setup({
    --
    --})
  },
}

return M
