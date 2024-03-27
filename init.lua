vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("lazy-setup")
require("lsp")
require("remapping")


require("telescope").load_extension "file_browser"

-- set color scheme to rose-pine 
-- vim.cmd("colorscheme rose-pine")
-- set color scheme to tokyonight night 
-- vim.cmd("colorscheme tokyonight-night")

-- set window to be transparent
--vim.cmd("highlight Normal guibg=none")
-- set guifg to be transparent
--vim.cmd("highlight NonText guifg=none")
-- set lualine to be transparent 
--vim.cmd("highlight lualine_c_normal guibg=none")

-- lualine 
require("lualine").setup {
  options = {
    theme = 'auto',
    section_separators = { '', '' },
  }
}

-- set line numbers to be shown (set number)
vim.wo.number = true

-- -- return { "sitiom/nvim-numbertoggle" }

-- if we are in a .ts file, indent size to 2 (and use spaces)
vim.cmd("autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab")
-- if we are in a .rs file, indent size to 4 (and use spaces)
vim.cmd("autocmd FileType rust setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab")
-- if we are in a .zig file, indent size to 4 (and use spaces)
vim.cmd("autocmd FileType zig setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab")
-- nvim notifications rebind to our plugin 
vim.notify = require("notify")

vim.opt.signcolumn = "yes"
-- highlight clear SignColumn
vim.cmd("highlight clear SignColumn")

vim.g.tokyonight_dark_float = false

require('transparent').clear_prefix('lualine')

local isBun = require("lspconfig/util").root_pattern("package.json", "tsconfig.json") ~= nil

require('Comment').setup()

-- run :highlight LineNr guifg=#595e66
vim.cmd("highlight LineNr guifg=#595e66")

vim.opt.conceallevel = 0--2

-- vim.cmd("NvimTreeOpen")

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end
})

--[[
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
--]]
