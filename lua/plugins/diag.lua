return {
  "folke/trouble.nvim",
  branch = "dev",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
   -- your configuration comes here
   -- or leave it empty to use the default settings
   -- refer to the configuration section below
  },
  setup = function () 
--[[	
    require("trouble").setup {
	
      views = {
        mini = {
          win_options = {
            winblend = 3000
          }
        }
       }
    }
		--]]
  end
 }
