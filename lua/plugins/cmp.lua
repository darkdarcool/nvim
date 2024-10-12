local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- lspkind
    "onsails/lspkind.nvim",
  },
  event = "LspAttach",
}

M.config = function()
  local cmp = require("cmp")

  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
      completion = {
        side_padding = 0,
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "Normal:Normal,FloatBorder:BorderBG,Search:None",
        #"Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
      },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. (strings[1] or "") .. " "
        kind.menu = "    (" .. (strings[2] or "") .. ")"
        return kind
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
    }, {}),
    mapping = {
      ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
  })

  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
end

return M
