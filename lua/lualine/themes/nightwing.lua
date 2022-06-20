local config = require("nightwing.config")
local palette = require("nightwing.palette")

local spec = palette.load_spec(config.variant)

local function gen_mode(color)
  return {
    a = { bg = color, fg = spec.bg0, gui = "bold" },
    b = { bg = spec.bg0, fg = spec.pal.accent.base },
    c = { bg = spec.bg0, fg = spec.fg3 },
  }
end

local nightwing = {
  normal = gen_mode(spec.pal.accent.base),
  insert = gen_mode(spec.pal.yellow.base),
  command = gen_mode(spec.pal.purple.base),
  visual = gen_mode(spec.pal.magenta.base),
  replace = gen_mode(spec.pal.red.base),
  inactive = gen_mode(spec.fg3),
}

return nightwing
