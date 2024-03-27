return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = true,
				custom = {
					'node_modules',
					'target',
					'result',
					'.git'
				}
			}
		})
	end,
}
