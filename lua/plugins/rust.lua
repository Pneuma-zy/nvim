local function codelldb_command()
  local mason_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
  if vim.fn.executable(mason_path) == 1 then
    return mason_path
  end
  return "codelldb"
end

local function rust_analyzer_command()
  local cargo_path = vim.fn.expand("~/.cargo/bin/rust-analyzer")
  if vim.fn.executable(cargo_path) == 1 then
    return cargo_path
  end

  local mason_path = vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer"
  if vim.fn.executable(mason_path) == 1 then
    return mason_path
  end

  return "rust-analyzer"
end

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^8",
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          cmd = { rust_analyzer_command() },
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = true,
              check = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          require("dapui").setup()
        end,
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_command(),
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Rust: Launch current binary",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/target/debug/",
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
        {
          name = "Rust: Attach remote (QEMU/gdbstub)",
          type = "codelldb",
          request = "attach",
          pid = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
