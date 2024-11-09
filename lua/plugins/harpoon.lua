return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      default = {
        display = function(list_item)
          -- normalize list_item.value
          local path = list_item.value
          local cwd = vim.uv.cwd()

          -- Is the path weird and contains the microsoft flavored paths?
          if string.find(path, "C:\\") or string.find(path, "C:/") then
            cwd = string.gsub(cwd, "\\", "/")
            path = string.gsub(path, cwd, "")
            -- leading / removal
            if path:sub(1, 1) then
              path = string.sub(path, 2)
            end
          end

          -- we dont like \'s here
          path = string.gsub(path, "\\", "/")

          return path
        end,
      },
    })
  end,

  keys = {
    {
      "<leader>j",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Add a buffer to harpoon",
    },
    {
      "<C-e>",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "List all harpoon buffers",
    },
    {
      "<leader>q",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Select the first item in the harpoon list",
    },
    {
      "<leader>w",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Select the second item in the harpoon list",
    },
    {
      "<leader>e",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Select the third item in the harpoon list",
    },
    {
      "<leader>r",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Select the fourth item in the harpoon list",
    },
  },
}
