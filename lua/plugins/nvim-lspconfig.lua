return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "<leader>ca", false },
          { "<leader>cc", false },
          { "<leader>cC", false },
          { "<leader>cR", false },
          { "<leader>cr", false },
          { "<leader>cA", false },
          { "<leader>cl", false },
          { "<leader>cs", false },
          { "<leader>cS", false },
        },
      },
      -- rustaceanvim owns Rust LSP startup. Disable nvim-lspconfig's
      -- rust-analyzer path so it does not start a second broken client.
      rust_analyzer = { enabled = false },
      -- Ensure mason installs the server
      clangd = {
        keys = {},
        cmd = { "clangd" },
      },
    },
  },
}
