local palette = require("nightwing.palette")
local group = require("nightwing.group")
local highlight = require("nightwing.lib.highlight")

local M = {}

function M.colorscheme()
  local config = require("nightwing.config")
  local spec = palette.load_spec(config.variant)
  local hls = group.get_highlights(spec, config)
  highlight.hl(hls)

  if config.options.terminal_colors then
    highlight.set_terminal_colors(spec)
  end
end

function M.setup(user_conf)
  local config = require("nightwing.config")
  config.set(user_conf)
end

return M
