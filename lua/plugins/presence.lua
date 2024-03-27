return {
--  "NyCodeGHG/presence.nvim",
  "andweeb/presence.nvim",
  event = "BufEnter",
  config = function()
    require("presence").setup({
      neovim_image_text = "nvim sucks btw",
      debounce_timeout = 10,
      editing_text = "Editing %s",
      workspace_text = "Working on %s",
      auto_update = true,
      main_image = "file",
      -- this options cooked
      -- enable_line_number = true
    })
  end
}
