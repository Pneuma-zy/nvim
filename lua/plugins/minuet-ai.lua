return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("minuet").setup({
        throttle = 800,
        debounce = 200,

        provider = "openai_fim_compatible",
        n_completions = 1,
        context_window = 256,

        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM",
            name = "Ollama",
            end_point = "http://127.0.0.1:11434/v1/completions",
            model = "qwen2.5-coder:3b",
            optional = {
              max_tokens = 48,
              top_p = 0.9,
            },
          },
        },

        -- AI 自动虚拟文本
        virtualtext = {
          auto_trigger_ft = { "*" },
          auto_trigger_ignore_ft = {
            "markdown", "text", "help", "gitcommit", "TelescopePrompt",
            "lazy", "mason", "dashboard", "alpha", "neo-tree", "NvimTree",
            "oil", "qf",
          },
          keymap = {
            accept = "<A-A>",
            accept_line = "<A-a>",
            accept_n_lines = "<A-z>",
            prev = "<A-[>",
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
      })
    end,
  },

  -- 只留一个可选：手动触发用（不把 AI 混进 cmp sources）
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.performance = opts.performance or {}
      opts.performance.fetching_timeout = 2000
    end,
  },
}
