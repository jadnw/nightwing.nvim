local M = {}

M.variants = {
  soft = "soft",
  medium = "medium",
  hard = "hard",
}

function M.load_spec(variant)
  variant = vim.tbl_contains(vim.tbl_keys(M.variants), variant) and variant or "hard"
  local colors = require("nightwing.colors")
  return colors.gen_spec(M.variants[variant], colors.pals)
end

return M
