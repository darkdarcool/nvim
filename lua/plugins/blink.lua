return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = {
    { 
      --'rafamadriz/friendly-snippets',
      'gmassman/friendly-snippets',
      branch = "patch-1"
    },
  },

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  opts = {
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = 'normal',

    sources = {
			providers = {
				{ "blink.cmp.sources.lsp", name = "LSP", score_offset = 99999 },
				{
					"blink.cmp.sources.snippets",
					name = "Snippets",
					score_offset = -1,
					-- keyword_length = 1, -- not supported yet
				},
				{
					"blink.cmp.sources.path",
					name = "Path",
					score_offset = 3,
					opts = { get_cwd = vim.uv.cwd },
				},
				{
					"blink.cmp.sources.buffer",
					name = "Buffer",
					keyword_length = 3,
					fallback_for = { "Path" }, -- PENDING https://github.com/Saghen/blink.cmp/issues/122
				},
			},
		},
    fuzzy = {
      max_items = 15,
    },
		trigger = {
			completion = {
				keyword_range = "full", -- full|prefix
		  },
      signature_help = {
        enabled = true
      }
		},
    keymap = {
			show = "<D-c>",
			hide = "<S-CR>",
			accept = "<CR>",
			select_next = { "<Tab>", "<Down>" },
			select_prev = { "<S-Tab>", "<Up>" },
			scroll_documentation_down = "<PageDown>",
			scroll_documentation_up = "<PageUp>",
		},
    windows = {
      documentation = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        --winhighlight = "Normal:Normal,FloatBorder:BorderBG,Search:None",
        auto_show = true,
        auto_show_delay_ms = 10,
			},
      autocomplete = {
				min_width = 10,
				max_height = 10,
				border = "rounded",
				-- selection = "auto_insert", -- PENDING https://github.com/Saghen/blink.cmp/issues/117
				selection = "preselect",
				cycle = { from_top = false }, -- cycle at bottom, but not at the top
			},
      signature_help = {
        border = "rounded",
        
      }
    }
  },
}
