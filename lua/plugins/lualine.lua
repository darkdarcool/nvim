--[[
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  setup = function ()
    local custom_vscode = require('lualine.themes.vscode')
    custom_vscode.normal.c.bg = 'None'

    local cyberdream = require('lualine.themes.cyberdream')

    require("lualine").setup {
      options = {
        theme = custom_vscode
      }
    }
  end,
}
--]]

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
      local colors = require("cyberdream.colors").default
      local cyberdream = require("lualine.themes.cyberdream")
      local copilot_colors = {
          [""] = { fg = colors.grey, bg = colors.none },
          ["Normal"] = { fg = colors.grey, bg = colors.none },
          ["Warning"] = { fg = colors.red, bg = colors.none },
          ["InProgress"] = { fg = colors.yellow, bg = colors.none },
      }
      return {
          options = {
              component_separators = { left = " ", right = " " },
              theme = cyberdream,
              globalstatus = true,
              disabled_filetypes = { statusline = { "dashboard", "alpha" } },
          },
          sections = {
              lualine_a = { { "mode", icon = "", color = { fg = colors.blue, bg = colors.none } } },
              lualine_b = { { "branch", icon = "" } },
              lualine_c = {
                  {
                      "diagnostics",
                      symbols = {
                          error = " ",
                          warn = " ",
                          info = " ",
                          hint = "󰝶 ",
                      },
                  },
                  { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                  {
                      "filename",
                      symbols = { modified = "  ", readonly = "", unnamed = "" },
                  },
                  {
                      function()
                          return require("nvim-navic").get_location()
                      end,
                      cond = function()
                          return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
                      end,
                      color = { fg = colors.green, bg = colors.none },
                  },
              },
	      lualine_x = {},
              lualine_y = {
                  {
                      "progress",
		       color = { fg = colors.red, bg = colors.none }
                  },
                  {
                      "location",
                      color = { fg = colors.cyan, bg = colors.none },
                  },
              },
              lualine_z = {
                
              },
	      
          },

          extensions = { "lazy" },
      }
  end,
}
