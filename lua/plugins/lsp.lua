return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "clangd", "lua_ls" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      -- clangd
      vim.lsp.config("clangd", {
        cmd = { "clangd" },
        filetypes = { "c", "cpp" },
      })

      -- lua language server
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- 启用它们
      vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")
    end,
  },

}

