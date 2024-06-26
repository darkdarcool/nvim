local lsp = require "lspconfig"
local utils = require("telescope.utils")
local oil = require("oil")

local bufnr = vim.api.nvim_get_current_buf()

-- ctrl t for TroubleToggle 
-- vim.keymap.set("n", "<C-t>", "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })


-- space f to open telescope 
vim.g.mapleader = " "
-- file_browser also works
-- vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob=!**/.git/**<CR>", { noremap = true, silent = true })
-- space f for oil 
-- vim.keymap.set("n", "<leader>f", function() oil.open() end, { noremap = true, silent = true });
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFocus<CR>")

vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga hover_doc<CR>')
-- <leader> shift d to lspsaga go_to_definition
vim.keymap.set('n', '<leader>D', '<cmd>Lspsaga goto_definition<CR>')

-- shift F to :ArenaToggle 

--ctrl f to to telescope.builtin.grep_string
vim.keymap.set('n', '<C-f>', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: ") })<CR>')

--[[
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
--]]

vim.keymap.set('n', '[', function() require("trouble").next({ mode = "diagnostics", jump = true }) end)
vim.keymap.set('n', ']', function () require("trouble").prev({ mode = "diagnostics", jump = true }) end)

-- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
-- vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>Lspsaga finder<CR>', { noremap = true, silent = true })
vim.keymap.set({'n', 't'}, '<C-T>', '<cmd>Lspsaga term_toggle<CR>', { noremap = true, silent = true })
-- on vim startup, open the aerial window
-- vim.cmd [[autocmd VimEnter * AerialOpen]]

vim.api.nvim_set_keymap('n', '<C-D>', '<cmd>ObsidianQuickSwitch<CR>', { noremap = true, silent = true})
-- space + r to do :Lspsaga rename
vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<CR>')
