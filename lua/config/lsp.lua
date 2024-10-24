local lsp = require("lspconfig")

lsp.denols.setup({
  cmd = { "deno", "lsp" },
  filetypes = { "typescript", "typescriptreact", "json" },
  settings = {
    deno = {
      enable = true,
      lint = true,
      unstable = true,
      inlayHints = {
        parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = false },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true, suppressWhenTypeMatchesName = false },
        enumMemberValues = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
      },
    },
    editor = {
      inlayHints = {
        enabled = "on",
      },
    },
  },
  root_dir = lsp.util.root_pattern("deno.json"),
})

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

lsp.lua_ls.setup({
  root_dir = lsp.util.root_pattern(".luarc.json"),
  settings = {
    Lua = {
      hint = { enable = true },
    },
  },
})

lsp.nushell.setup({})

lsp.ccls.setup({
  init_options = {
    cache = {
      directory = ".ccls-cache";
    }
  }
})

lsp.zls.setup({})

lsp.rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true
      },
      inlayHints = {
        typeHints = { enable = true },
        chainingHints = { enable = true },
        parameterHints = { enable = true },
        closingBraceHints = { enable = true }
      }
    }
  }
})

--[[
require("lspkind").setup({
  mode = "symbol_text",
  preset = "codicons",
  symbol_map = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    --TypeParameter = "",
    TypeParameter = "",
  },
})
--]]
