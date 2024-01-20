return {
  "NyCodeGHG/presence.nvim",
  event = "BufEnter",
  config = function()
    require("presence").setup({
      neovim_image_text = "nvim sucks btw",
      debounce_timeout = 10,
      editing_text = "Editing %s",
      workspace_text = "Working on %s",
      auto_update = true,
    })
  end
}