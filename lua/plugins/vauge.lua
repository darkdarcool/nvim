return {
  "vague2k/vague.nvim",
  config = function()
    require("vague").setup({
        transparent = true
    })

    vim.cmd("colorscheme vauge")
  end,
  enabled = false
}