return {
  "Pocco81/auto-save.nvim",
  event = { "InsertEnter", "TextChanged" },
  config = function()
    require("auto-save").setup({})
  end,
}