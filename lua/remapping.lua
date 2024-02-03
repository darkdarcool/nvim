local lsp = require "lspconfig"

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


-- space f to open telescope 
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", "<cmd>Telescope file_browser find_command=rg,--ignore,--hidden,--files<CR>", { noremap = true, silent = true })
