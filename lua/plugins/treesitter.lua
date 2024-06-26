return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "typescript", "rust", "javascript", "markdown", "markdown_inline", "swift" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end,
  dependencies = {
		{ "nushell/tree-sitter-nu" },
	}
}
