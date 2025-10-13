return {
  "williamboman/mason.nvim",
  version = "1.24.0" ,
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
