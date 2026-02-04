return {
  -- Avoid conflict with Minuet virtualtext (extmark replace mode).
  -- Use virtual_lines instead of inline virtual_text.
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.virtual_text = false
      opts.diagnostics.virtual_lines = true
    end,
  },
}
