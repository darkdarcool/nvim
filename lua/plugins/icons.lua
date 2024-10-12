return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    strict = true,
    override_by_extension = {
      ["ts"] = {
        icon = "󰛦",
        color = "#519aba",
        cterm_color = "74",
        name = "TypeScript",
      },
    },
  },
  --event = "VeryLazy",
  priority = 1000,
  -- lazy = false,
}
