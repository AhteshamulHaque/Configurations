local M = {}

function M.post()
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
    },
    folder = {
      open = "▾",
      default = "▸",
    },
  }
  require("nvim-tree").setup({
    disable_netrw = false,
    auto_close = 1,
    view = {
      width = 30,
    },
    update_focused_file = {
      enable = true,
    },
  })

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  --  NerdTree like mappings
  map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
  map('n', '<C-f>', ':NvimTreeFindFile<CR>', opts)
end

return M
