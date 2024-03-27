
local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		-- lspkind
		"onsails/lspkind.nvim"
	},
}

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

M.config = function()
	local cmp = require("cmp")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	cmp.setup({
		completion = {
			completeopt = 'menu,menuone,noinsert'
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
			documentation = {
				border = "solid", --border "CmpDocBorder",
				-- winhighlight = "Normal:CmpDoc"
				winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None"
			},
			completion = {
				-- border = border "CmpItemBorder",
				-- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
				--winhighlight = "Normal:NormalFloat,NormalFloat:Pmenu,Pmenu:NormalFloat"
				side_padding = 0
			},
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			-- ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<Tab>"] = cmp.mapping.confirm({ select = false })

		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" }, -- For luasnip users.
			-- { name = "orgmode" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
				{ name = "emoji" }
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item) 
				local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      				local strings = vim.split(kind.kind, "%s", { trimempty = true })
      				kind.kind = " " .. (strings[1] or "") .. " "
      				kind.menu = "    (" .. (strings[2] or "") .. ")"
      				return kind
			end

		}
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			}, {
				{ name = "cmdline" },
		}),
	})
end

return M
