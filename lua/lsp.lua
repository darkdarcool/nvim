local lsp = require "lspconfig"


require("lspconfig").denols.setup {
  cmd = { "deno", "lsp" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "json" },
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  },
  root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", ".git"),
}

-- lspconfig for zig 
require("lspconfig").zls.setup {
  cmd = { "zls" },
  filetypes = { "zig" },
  root_dir = require("lspconfig/util").root_pattern(".git"),
}

lsp.rust_analyzer.setup({
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = require("lspconfig/util").root_pattern(".git"),
})


require ('nvim-treesitter.configs').setup {
  indent = {
    enable = true
  }
}