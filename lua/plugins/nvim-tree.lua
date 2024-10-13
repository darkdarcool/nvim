return {
  "nvim-tree/nvim-tree.lua",
  name = "nvim-tree",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        enable = true,
        custom = { "node_modules", "target", "result", ".git", "zig-cache", "zig-out", ".ccls-cache" }
      },
      git = {
        enable = false,
      },
      update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = false,
        ignore_list = {},
      },
      hijack_cursor = true,
      hijack_netrw = true,
      disable_netrw = true,
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local WIDTH_RATIO = 0.5
            local HEIGHT_RATIO = 0.8

            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * 0.5)
        end,
      },
    })
  end,
  keys = {
    { "<leader>f", "<cmd>NvimTreeOpen<cr>", desc = "Open the file tree" },
  },
}
