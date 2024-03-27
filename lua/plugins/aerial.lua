return {
  -- 'stevearc/aerial.nvim',
  'darkdarcool/aerial.nvim',
  opts = {
    
  },
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  setup = function ()
    -- call :AerialOpen on startup 
--    vim.cmd [[autocmd VimEnter * AerialOpen]]
  end
}
