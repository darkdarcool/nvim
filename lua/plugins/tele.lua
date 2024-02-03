return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("telescope").setup({
        -- ignore node_modules, target (rust), and zig-cache, and .git
        defaults = {
          file_ignore_patterns = { "node%_modules/.*", "target/.*", "zig%-cache/.*", "%.git/.*" },
        },
        -- remap delete file from alt + d to delete key 
        mappings = {
          -- <DEL>
          i = {
            ["<DEL>"] = require("telescope.actions").delete_buffer,
          },
        }
        
      })
    end
  }