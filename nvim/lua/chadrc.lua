-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "ayu_dark",
  transparency = true,

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.term = {
    float = {
      relative = "editor",
      row = 0.1,
      col = 0.13,
      width = 0.7,
      height = 0.7,
      border = "rounded",
    }
}

M.whichkey = {
  border = "rounded",
}

return M
