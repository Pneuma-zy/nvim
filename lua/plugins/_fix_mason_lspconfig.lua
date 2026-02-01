return {
  -- 关键：启动就加载，让它的 lua/ 进入 package.path
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "mason-org/mason.nvim" },
    opts = {},
  },

  -- 关键：把依赖关系补回去，避免你哪里覆盖了 nvim-lspconfig spec 导致依赖丢失
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
  },
}
