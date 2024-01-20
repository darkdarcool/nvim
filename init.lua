require("lazy-setup")
local lsp = require "lspconfig"

-- keybinds

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n", 
  "<leader>a", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

-- space f to open telescope 
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", "<cmd>Telescope file_browser find_command=rg,--ignore,--hidden,--files<CR>", { noremap = true, silent = true })

require("telescope").load_extension "file_browser"

-- set color scheme to rose-pine 
vim.cmd("colorscheme rose-pine")

-- lspconfig for deno 
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


local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n", 
  "<leader>a", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

-- ctrl t for TroubleToggle 
vim.keymap.set("n", "<C-t>", "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })