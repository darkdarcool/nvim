return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- don't italisize 
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
    }
  },

  setup = function () 
    require("tokyo").setup {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function (colors)
        colors.bg_statusline = "#ff00ff"
      end
    }
  end
}