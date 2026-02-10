return {
  -- Do not pin mason versions: LazyVim's current LSP flow depends on newer
  -- mason-lspconfig behavior for automatic server enabling.
  {
    "mason-org/mason.nvim",
    version = false,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = false,
  },
}
