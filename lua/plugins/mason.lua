return {
  "mason_org/mason.nvim",
  keys = {
    { "<leader>cm", false },
  },
  opts = {
    ensure_installed = {
      "html-lsp",
      "prettier",
      "pyright",
      "autopep8",
    },
  },
}
