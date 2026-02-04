return {
  "mason-org/mason.nvim",
  keys = {
    { "<leader>cm", false },
  },
  opts = {
    ensure_installed = {
      "clangd",
      "html-lsp",
      "prettier",
      "pyright",
      "autopep8",
    },
  },
}
