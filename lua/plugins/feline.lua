local M = {
  "freddiehaddad/feline.nvim",
  dependencies = {
    { "lewis6991/gitsigns.nvim", opts = {} },
  },
  event = "VeryLazy",
}

local vi_mode_colors = {
  ["NORMAL"] = "#5ef1ff",
  ["INSERT"] = "#7b8496",
  ["VISUAL"] = "#ff5ef1",
  ["COMMAND"] = "#5eff6c",
}

M.config = function()
  --require("gitsigns").setup()
  local feline = require("feline")
  local vi_mode = require("feline.providers.vi_mode")
  local theme = { bg = "none" }

  -- Our statusline
  local components = {
    active = {},
    inactive = {},
  }

  -- Our providers
  local providers = {
    diag = function(_, opts)
      local file_diagnostic_count = #vim.diagnostic.get(0, { severity = opts.severity })
      local workspace_diagnostic_count = #vim.diagnostic.get(nil, { severity = opts.severity })

      if file_diagnostic_count == workspace_diagnostic_count then
        return file_diagnostic_count .. " "
      else
        return file_diagnostic_count .. " (" .. workspace_diagnostic_count .. ")"
      end
    end,
  }

  -- Initialize the components in the statusline
  table.insert(components.active, {}) -- left
  table.insert(components.active, {}) -- middle
  table.insert(components.active, {}) -- right

  -- vi_mode component (displays state, like 'INSERT' or 'NORMAL')
  table.insert(components.active[1], {
    provider = function()
      return string.format("%s", vi_mode.get_vim_mode())
    end,
    hl = function()
      return { fg = vi_mode_colors[vi_mode.get_vim_mode()] }
    end,
    right_sep = {
      always_visible = true,
      str = " | ",
      hl = { fg = "none", bg = "none" },
    },
    left_sep = {
      str = " ",
    },
  })

  -- file name
  table.insert(components.active[1], {
    provider = {
      name = "file_info",
      opts = { colored_icon = true, file_modified_icon = "" },
      --right_sep = {
      --  always_visible = true,
      --  str = ' | ',
      --  hl = { fg = 'none', bg = 'none' },
      --}
    },
  })

  -- global error diagnostics
  table.insert(components.active[1], {
    provider = {
      name = "diag",
      opts = {
        severity = vim.diagnostic.severity.ERROR,
      },
      update = { "DiagnosticChanged", "BufEnter", "LspAttach" },
    },
    icon = {
      str = " " .. " ",
      hl = { fg = "#ff5e5e" },
    },
    hl = {
      fg = "#ff5e5e",
    },
    left_sep = {
      always_visible = true,
      str = " | ",
      hl = { fg = "none", bg = "none" },
    },
  })

  -- global warning diagnostics
  table.insert(components.active[1], {
    provider = {
      name = "diag",
      opts = {
        severity = vim.diagnostic.severity.WARN,
      },
      update = { "DiagnosticChanged", "BufEnter", "LspAttach" },
    },
    icon = {
      str = " " .. " ",
      hl = { fg = "#f1ff5e" },
    },
    hl = {
      fg = "#f1ff5e",
    },
    left_sep = {
      always_visible = true,
      str = " ",
      hl = { bg = "none", fg = "none" },
    },
  })

  -- global hint diagnostic
  table.insert(components.active[1], {
    provider = {
      name = "diag",
      opts = {
        severity = vim.diagnostic.severity.HINT,
      },
      update = { "DiagnosticChanged", "BufEnter", "LspAttach" },
    },
    icon = {
      str = "󰛿 " .. " ",
      hl = { fg = "#5ef1ff" },
    },
    hl = {
      fg = "#5ef1ff",
    },
    left_sep = {
      always_visible = true,
      str = " ",
      hl = { bg = "none", fg = "none" },
    },
  })

  -- workspace name
  table.insert(components.active[3], {
    provider = function()
      -- all content after the last '/'
      local cwd = vim.uv.cwd()
      cwd = cwd:gsub(".*[%/%\\]", "")
      return cwd
    end,
    icon = {
      str = " ",
    },
    right_sep = {
      always_visible = true,
      str = " |",
      hl = { bg = "none", fg = "none" },
    },
  })

  -- git diff add
  table.insert(components.active[3], {
    provider = "git_diff_added",
    hl = { fg = "#08bab7", bg = "none" },
  })

  -- git diff modified
  table.insert(components.active[3], {
    provider = "git_diff_changed",
    hl = { fg = "#f9c859", bg = "none" },
  })

  -- git diff removed
  table.insert(components.active[3], {
    provider = "git_diff_removed",
    hl = { fg = "#ec5295", bg = "none" },
    --right_sep = {
    --  always_visible = false,
    --  str = " |",
    --  hl = { fg = "none", bg = "none" },
    --},
  })

  -- cursor position relative to the current buf
  table.insert(components.active[3], {
    provider = "line_percentage",
    left_sep = {
      always_visible = true,
      str = " | ",
      hl = { bg = "none", fg = "none" },
    },
    right_sep = {
      str = " ",
    },
    hl = { fg = "#ff6e5e", bg = "hone" },
  })

  feline.setup({
    components = components,
    vi_mode_colors = vi_mode_colors,
    custom_providers = providers,
    force_inactive = {
      filetypes = {
        "oil",
      },
    },
  })
  feline.use_theme(theme)
end

return M
