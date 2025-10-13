return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = function()
    local is_transparent = false
    if not vim.g.neovide == true then
      is_transparent = true
    end
    return {
      style = "moon",
      transparent = is_transparent,
      styles = {
        floats = "transparent",
        sidebars = "transparent",
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true },
        variables = { italic = false },
      },
    }
  end,
}
