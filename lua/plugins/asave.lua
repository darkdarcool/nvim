return {
  "okuuva/auto-save.nvim",
  event = { "InsertEnter", "TextChanged" },
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        enabled = false -- get rid of the notification when auto save is triggered
      }
    })
  end,
}