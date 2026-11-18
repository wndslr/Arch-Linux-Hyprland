local colors = {
  pink = "#E5A0B0",
  purple = "#C3A0E0",
  blue = "#91BCE8",
  green = "#A0CCA5",
  yellow = "#E2C17D",
  orange = "#E5A879",
  gray = "#AAAAAA",
}

local highlights = {
  ["@keyword"] = colors.purple,
  ["@function"] = colors.blue,
  ["@function.call"] = "#A9C9EA",
  ["@string"] = colors.green,
  ["@type"] = colors.yellow,
  ["@variable"] = "#D0D0D0",
  ["@constant"] = colors.orange,
  ["@number"] = "#DDAA8C",
  ["@operator"] = "#B5B5B5",
  ["@comment"] = "#777777",
  ["@property"] = colors.pink,
  ["@constructor"] = "#B5CDA0",
  ["@attribute"] = "#D8A8C8",
}

for group, color in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, { fg = color })
end

vim.api.nvim_set_hl(0, "lualine_a_insert", {
  fg = "#1C211D",
  bg = "#A9C9AD",
  bold = true,
})
