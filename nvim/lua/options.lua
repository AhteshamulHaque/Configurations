require "nvchad.options"

-- add yours here!
local o = vim.opt
o.cursorlineopt ='both'                         -- to enable cursorline!
o.guicursor = 'n-v-c-i-ci-ve:block-blinkon50'   -- to change cursor to block
o.relativenumber = true                         -- enable relative numbering
o.swapfile = false                              -- disable swapfile retention
o.scrolloff = 8                                 -- prevents cursor to hit top of bottom
