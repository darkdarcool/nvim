local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { noremap = true, silent = true })

require("lazy").setup(
  {
    {
      import = "plugins"
    },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
      'numToStr/Comment.nvim',
      opts = {
          -- add any options here
      },
      lazy = false,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    {
      "github/copilot.vim",
      cmd = "Copilot",
      event = "InsertEnter",
      ft = "markdown"
    },
    {
      "neovim/nvim-lspconfig",
      config = function () 
        -- show lsp documentation in a floating window
        
      end
    },
 --[[
    {
      'williamboman/mason.nvim',
      config = function ()
        require("mason").setup()
      end
    },
--]]
    {
      'williamboman/mason-lspconfig.nvim'
    },
    {
      'xiyaowong/transparent.nvim',
    }
  }
)
