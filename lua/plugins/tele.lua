local trouble = require("trouble.providers.telescope")

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("telescope").setup({
        -- ignore node_modules, target (rust), and zig-cache, and .git
        defaults = {
          file_ignore_patterns = { "node%_modules/.*", "target/.*", "zig%-cache/.*", "%.git/.*" },
          mappings = {
            -- <DEL>
            i = {
              ["<DEL>"] = require("telescope.actions").delete_buffer,
              ["<c-t>"] = trouble.open_with_trouble,
            },
            n = {
              -- ["<DEL>"] = require("telescope.actions").delete_buffer,
              ["<c-t>"] = trouble.open_with_trouble,
            },
          },  
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
          }
        }
        -- remap delete file from alt + d to delete key 
        
      })
    end
  }