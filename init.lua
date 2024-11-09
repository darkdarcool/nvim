vim.loader.enable()

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.signcolumn = "no"
vim.opt.number = true
vim.o.termguicolors = true
vim.opt.fillchars = { eob = " " }

vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_show_icons = {
  git = 0,
}

require("config.lazy")
require("config.lsp")

-- tab size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
--require("lsp-endhints").enable()

vim.cmd("hi BlinkCmpSignatureHelpActiveParameter guifg=#5ef1ff guibg=#7b8496")
