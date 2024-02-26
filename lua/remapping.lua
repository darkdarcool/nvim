local lsp = require "lspconfig"
local utils = require("telescope.utils")


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
-- vim.keymap.set("n", "<C-t>", "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })


-- space f to open telescope 
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", "<cmd>Telescope file_browser find_command=rg,--ignore,--hidden,--files<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga hover_doc<CR>')
-- <leader> shift d to lspsaga go_to_definition
vim.keymap.set('n', '<leader>D', '<cmd>Lspsaga goto_definition<CR>')

-- shift F to :ArenaToggle 
vim.keymap.set('n', '<leader>F', '<cmd>ArenaToggle<CR>')

--ctrl f to to telescope.builtin.grep_string
vim.keymap.set('n', '<C-f>', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: ") })<CR>')

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>Lspsaga finder<CR>', { noremap = true, silent = true })
-- on vim startup, open the aerial window
vim.cmd [[autocmd VimEnter * AerialOpen]]