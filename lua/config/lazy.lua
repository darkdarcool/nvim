local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "dstein64/vim-startuptime" },
    { import = "plugins" },
    {
      "neovim/nvim-lspconfig",
      after = { "nvim-cmp" },
      event = { "BufRead", "BufNewFile", "InsertEnter" },
      keys = {
        { "<leader>d", vim.lsp.buf.hover, desc = "View hover docs" },
        { "<leader>D", vim.lsp.buf.definition, desc = "Jump to definition" },
      },
    },
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
      lazy = false,
      --event = "VeryLazy",
    },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
      event = "LspAttach",
    },
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  defaults = { lazy = true },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
  ui = { border = "rounded" },
  debug = false,
})
