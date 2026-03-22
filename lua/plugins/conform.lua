return {
  "stevearc/conform.nvim",
  optional = true,
  keys = {
    { "<leader>cF", false },
  },
  opts = {
    formatters_by_ft = {
      -- autopep8 seems faster than black in this setup.
      python = { "autopep8" },
      css = { "prettier" },
      html = { "prettier" },
      rust = { "rustfmt" },
    },
  },
}
