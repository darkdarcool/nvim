require("lazy-setup")
require("lsp")
require("remapping")



require("telescope").load_extension "file_browser"

-- set color scheme to rose-pine 
vim.cmd("colorscheme rose-pine")

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

-- I want to delete a file in telescope.nvim. I see that the docs say to do <A-d>/d remove Delete (multi-)selected files/folders, but I don't understand what it means, can you explain?
-- Sure! <A-d> means Alt-d, and /d means d. So you can either press Alt-d or d to delete the file.
-- Ok! Let's rebind it to the DELETE key!
