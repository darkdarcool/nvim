return {
  "mikesmithgh/borderline.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("borderline").setup({
      enabled = true,
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      border_styles = {
        "none",
      },
    })
  end,
  enabled = false,
}
