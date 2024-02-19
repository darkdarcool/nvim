return {
  "dzfrias/arena.nvim",
  event = "BufWinEnter",
  -- Calls `.setup()` automatically
  config = {
    max_items = 10,
    window = {
      width = 80,
      height = 12,
      border = "rounded"
    }
  }
}