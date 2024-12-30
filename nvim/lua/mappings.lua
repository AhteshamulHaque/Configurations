require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })

-- save current session for the current directory
map("n", "<leader>qs", function()
  require("persistence").save()
end, { desc = "Save current session" })

-- select a session to load
map("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select session to load" })

-- load the last session
map("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Load last session" })

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Stop Persistence"})

-- floating vertical terminal
map({"n", "t"}, "<leader>v",  function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.3, id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

-- floating horizontal terminal
map({"n", "t"}, "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.3, id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

-- floating central terminal
map({"n", "t"}, "<leader>tf", function()
  require("nvchad.term").toggle {
    pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
