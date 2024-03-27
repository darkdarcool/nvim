local lsp = require "lspconfig"

require("lspconfig").denols.setup {
  cmd = { "deno", "lsp" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "json" },
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  },
  single_file_support = false,
  root_dir = require("lspconfig").util.root_pattern("deno.json")
  -- root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", ".git"),
}

-- require("lspconfig").tsserver.setup {
--   cmd = { "typescript-language-server", "--stdio" },
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--   root_dir = require("lspconfig").util.root_pattern("package.json")
-- }

-- lspconfig for zig 
require("lspconfig").zls.setup {}

lsp.rust_analyzer.setup({
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = require("lspconfig").util.root_pattern("Cargo.toml"),
})

lsp.swift_mesonls.setup({
  cmd = { "Swift-Mesonlsp", "--lsp" },
  root_dir = require("lspconfig").util.root_pattern("Package.swift"),
  file_types = { "swift" },
})

lsp.lua_ls.setup({})

lsp.nil_ls.setup({})

require ('nvim-treesitter.configs').setup {
  indent = {
    enable = true
  }
}
