--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "haslo"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "\\"

-- custom options
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.updatetime = 4000
vim.opt.timeoutlen = 1000
vim.opt.nrformats = "alpha,octal,hex"

vim.cmd([[
  " Cursor settings
  set guicursor=n:ver50-blinkon50,i:block-blink50,v:hor30-blinkon50

  nnoremap <leader>N O<Esc>
  nnoremap <leader>n o<Esc>
  vnoremap df <Esc>

  " Shortcut to use blackhole register by default
  nnoremap d "_d
  nnoremap D "_D
  vnoremap D "_D
  nnoremap c "_c
  vnoremap c "_c
  nnoremap x "_x
  vnoremap x "_x
  nnoremap X "_X
  vnoremap X "_X

  " Shortcut to use clipboard with <leader>
  nnoremap <leader>d d
  vnoremap <leader>d d
  nnoremap <leader>D D
  vnoremap <leader>D D
  nnoremap <leader>c c
  vnoremap <leader>c c
  nnoremap <leader>C C
  vnoremap <leader>C C
  nnoremap <leader>x x
  vnoremap <leader>x x
  nnoremap <leader>X X
  vnoremap <leader>X X
  nnoremap <BS> X

  " Use arrow keys for scrolling
  noremap <Up> <C-y>
  noremap <Down> <C-e>
  noremap <Left> zh
  noremap <Right> zl
]])

-- Barbar keymaps
vim.cmd([[
  " Move to previous/next
  nnoremap <silent>    <A-,> :BufferPrevious<CR>
  nnoremap <silent>    <A-.> :BufferNext<CR>

  " Re-order to previous/next
  nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
  nnoremap <silent>    <A->> :BufferMoveNext<CR>

  " Goto buffer in position...
  nnoremap <silent>    <A-1> :BufferGoto 1<CR>
  nnoremap <silent>    <A-2> :BufferGoto 2<CR>
  nnoremap <silent>    <A-3> :BufferGoto 3<CR>
  nnoremap <silent>    <A-4> :BufferGoto 4<CR>
  nnoremap <silent>    <A-5> :BufferGoto 5<CR>
  nnoremap <silent>    <A-6> :BufferGoto 6<CR>
  nnoremap <silent>    <A-7> :BufferGoto 7<CR>
  nnoremap <silent>    <A-8> :BufferGoto 8<CR>
  nnoremap <silent>    <A-9> :BufferLast<CR>

  " Pin/unpin buffer
  nnoremap <silent>    <A-p> :BufferPin<CR>

  " Close buffer
  nnoremap <silent>    <A-c> :BufferClose<CR>

  " Magic buffer-picking mode
  nnoremap <silent> <C-s>    :BufferPick<CR>

  " Sort automatically by...
  nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
  nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
  nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
  nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>
]])
-- add your own keymapping
lvim.keys.normal_mode["<leader>w"] = ":w<cr>"
lvim.keys.normal_mode[";"] = ":"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "NTBBloodbath/galaxyline.nvim",
    config = function()
      require('status_line').post()
    end,
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      { "nvim-lua/lsp-status.nvim" }
    }
  },

  {
    "triglav/vim-visual-increment"
  },

  {
    "chipsenkbeil/distant.nvim",
    config = function()
      require('distant').setup {
        -- Applies Chip's personal settings to every machine you connect to
        --
        -- 1. Ensures that distant servers terminate with no connections
        -- 2. Provides navigation bindings for remote directories
        -- 3. Provides keybinding to jump into a remote file's parent directory
        ['*'] = require('distant.settings').chip_default()
      }
    end
}

--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
}
-- lvim.builtin.lualine.options.theme = "gruvbox"

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
    -- Restore terminal cursor on exit
    { "VimLeave", "*", "set guicursor=a:block-blinkon0" }
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
}
