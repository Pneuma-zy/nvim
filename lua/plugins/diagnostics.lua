return {
  -- Prefer inline virtual_text (line end) instead of virtual_lines.
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.virtual_text = true
      opts.diagnostics.virtual_lines = false
    end,
  },
}
