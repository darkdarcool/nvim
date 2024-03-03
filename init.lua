require("lazy-setup")
require("lsp")
require("remapping")


require("telescope").load_extension "file_browser"

-- set color scheme to rose-pine 
-- vim.cmd("colorscheme rose-pine")
-- set color scheme to tokyonight night 
-- vim.cmd("colorscheme tokyonight-night")

-- set window to be transparent
vim.cmd("highlight Normal guibg=none")
-- set guifg to be transparent
vim.cmd("highlight NonText guifg=none")
-- set lualine to be transparent 
vim.cmd("highlight lualine_c_normal guibg=none")

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

vim.opt.conceallevel = 2

-- use pwsh as the terminal via set shell 
local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end