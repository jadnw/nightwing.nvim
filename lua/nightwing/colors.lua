local Color = require("nightwing.lib.color")

local M = {}

local C = Color:new({
  bg = "#14161f",
  fg = "#b1b7cd",
  factor = 0.25,
})

M.pals = {
  soft = {
    accent = C:shade("#73cfdd"),
    black = C:shade("#464e6d"),
    red = C:shade("#f4676a"),
    green = C:shade("#93c68c"),
    blue = C:shade("#88a2ff"),
    yellow = C:shade("#e8ce9b"),
    orange = C:shade("#f4a582"),
    cyan = C:shade("#73cfdd"),
    teal = C:shade("#68dfbb"),
    magenta = C:shade("#e397bb"),
    purple = C:shade("#a293ff"),
    white = C:shade("#c1c6d7"),
    comment = "#67749e",
    bg0 = "#1d1f2c",
    bg1 = "#222535",
    bg2 = "#262a3c",
    bg3 = "#31374c",
    bg4 = "#444c6a",
    fg0 = "#e0e2eb",
    fg1 = "#c1c6d7",
    fg2 = "#b1b7cd",
    fg3 = "#a2a9c3",
    sel0 = "#5a648c",
    sel1 = "#737ea5",
  },
  medium = {
    accent = C:shade("#73cfdd"),
    black = C:shade("#464e6d"),
    red = C:shade("#f4676a"),
    green = C:shade("#93c68c"),
    blue = C:shade("#88a2ff"),
    yellow = C:shade("#e8ce9b"),
    orange = C:shade("#f4a582"),
    cyan = C:shade("#73cfdd"),
    teal = C:shade("#68dfbb"),
    magenta = C:shade("#e397bb"),
    purple = C:shade("#a293ff"),
    white = C:shade("#c1c6d7"),
    comment = "#63709c",
    bg0 = "#14161f",
    bg1 = "#1e212f",
    bg2 = "#262a3c",
    bg3 = "#32384e",
    bg4 = "#434a67",
    fg0 = "#e0e2eb",
    fg1 = "#c1c6d7",
    fg2 = "#b1b7cd",
    fg3 = "#a2a9c3",
    sel0 = "#5a648c",
    sel1 = "#737ea5",
  },
  hard = {
    accent = C:shade("#73cfdd"),
    black = C:shade("#464e6d"),
    red = C:shade("#f4676a"),
    green = C:shade("#93c68c"),
    blue = C:shade("#88a2ff"),
    yellow = C:shade("#e8ce9b"),
    orange = C:shade("#f4a582"),
    cyan = C:shade("#73cfdd"),
    teal = C:shade("#68dfbb"),
    magenta = C:shade("#e397bb"),
    purple = C:shade("#a293ff"),
    white = C:shade("#c1c6d7"),
    comment = "#5a648c",
    bg0 = "#0c0e14",
    bg1 = "#14161f",
    bg2 = "#1e212f",
    bg3 = "#282d3e",
    bg4 = "#3c435d",
    fg0 = "#e0e2eb",
    fg1 = "#c1c6d7",
    fg2 = "#b1b7cd",
    fg3 = "#a2a9c3",
    sel0 = "#5a648c",
    sel1 = "#737ea5",
  },
}

--- Generate spec
-- @param accent string
-- @param pal table
function M.gen_spec(variant, pals)
  local pal = pals[variant]

  local spec = {
    bg0 = pal.bg0, -- Dark bg (status line and float)
    bg1 = pal.bg1, -- Default bg
    bg2 = pal.bg2, -- Lighter bg (colorcolm folds)
    bg3 = pal.bg3, -- Lighter bg (cursor line)
    bg4 = pal.bg4, -- Conceal, border fg

    fg0 = pal.fg0, -- Lighter fg
    fg1 = pal.fg1, -- Default fg
    fg2 = pal.fg2, -- Darker fg (status line)
    fg3 = pal.fg3, -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  spec.pal = {
    accent = pal.accent,
    black = pal.black,
    red = pal.red,
    green = pal.green,
    blue = pal.blue,
    yellow = pal.yellow,
    orange = pal.orange,
    cyan = pal.cyan,
    teal = pal.teal,
    magenta = pal.magenta,
    purple = pal.purple,
    white = pal.white,
  }

  spec.syntax = {
    attr = pal.yellow.base, -- HTML tag attribues
    bool = pal.orange.base, -- Boolean
    bracket = spec.fg2, -- Brackets and Punctuation
    builtin0 = pal.teal.base, -- Builtin variable
    builtin1 = pal.yellow.base, -- Builtin type
    builtin2 = pal.orange.base, -- Builtin const
    builtin3 = pal.red.bright, -- Not used
    comment = pal.comment, -- Comment
    conditional = pal.magenta.base, -- Conditional and loop
    const = pal.orange.bright, -- Constants, imports and booleans
    constructor = pal.orange.base, -- Constructor, JSX elements
    dep = spec.fg3, -- Deprecated
    field = pal.cyan.base, -- Field, Property
    func = pal.blue.base, -- Functions and Titles
    ident = pal.magenta.bright, -- Identifiers
    keyword = pal.purple.base, -- Keywords
    number = pal.orange.bright, -- Numbers
    operator = pal.purple.bright, -- Operators
    param = pal.magenta.bright, -- Params
    preproc = pal.magenta.base, -- PreProc
    regex = pal.orange.base, -- Regex
    statement = pal.purple.base, -- Statements
    string = pal.green.base, -- Strings
    tag_delimiter = pal.teal.base, -- Tag delimiter
    type = pal.yellow.base, -- Types
    variable = spec.fg1, -- Variables
  }

  spec.diag = {
    error = pal.red.base,
    warn = pal.yellow.base,
    info = pal.cyan.base,
    hint = pal.green.base,
  }

  spec.diff = {
    add = pal.green.dim,
    delete = pal.red.dim,
    change = pal.cyan.dim,
    text = pal.cyan.dim,
  }

  spec.git = {
    add = pal.cyan.base,
    removed = pal.red.base,
    changed = pal.yellow.base,
    conflict = pal.orange.base,
    ignored = pal.comment,
  }

  return spec
end

return M
