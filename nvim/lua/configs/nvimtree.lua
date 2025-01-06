local nvim_tree = require("nvim-tree")

local width = vim.api.nvim_win_get_width(0)
local height = vim.api.nvim_win_get_height(0)

nvim_tree.setup({
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = math.floor(width * 0.7),    -- 70% of the screen width
        height = math.floor(height * 0.7),  -- 70% of the screen height
        row = math.floor((height - math.floor(height * 0.7)) / 2),
        col = math.floor((width - math.floor(width * 0.7)) / 2),
      }
    },
  },
  renderer = {
    highlight_opened_files = "name",
  },
  filters = {
    dotfiles = false,      -- Show hidden files by default
    custom = { ".git" },   -- Hide .git folder by default
  },
})
