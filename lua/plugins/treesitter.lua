return {
  "nvim-treesitter/nvim-treesitter",
  --build = ":TSUpdate",
  event = "BufEnter",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "typescript", "rust", "javascript", "markdown", "markdown_inline" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = false,
    })
  end,
  dependencies = {
    -- { "nushell/tree-sitter-nu" },
  },
}
