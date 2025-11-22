return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")

      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      dap_python.setup("python3")

      -- Configure codelldb adapter (from Nix dev shell)
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.env.CODELLDB_PATH or "codelldb",
          args = { "--port", "${port}" },
        },
      }

      -- Configure C/C++/Rust debugging
      dap.configurations.c = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- Reuse C configuration for C++ and Rust
      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI (lazy load dapui only when needed)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        require("dapui").close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        require("dapui").close()
      end

      local opts = { noremap = true, silent = true }

    --   -- Toggle breakpoint
    --   vim.keymap.set("n", "<leader>db", function()
    --     dap.toggle_breakpoint()
    --   end, opts)
    --
    --   -- Continue / Start
    --   vim.keymap.set("n", "<leader>dc", function()
    --     dap.continue()
    --   end, opts)
    --
    --   -- Step Over
    --   vim.keymap.set("n", "<leader>do", function()
    --     dap.step_over()
    --   end, opts)
    --
    --   -- Step Into
    --   vim.keymap.set("n", "<leader>di", function()
    --     dap.step_into()
    --   end, opts)
    --
    --   -- Step Out
    --   vim.keymap.set("n", "<leader>dO", function()
    --     dap.step_out()
    --   end, opts)
    --
    --   -- Keymap to terminate debugging
    -- vim.keymap.set("n", "<leader>dq", function()
    --     require("dap").terminate()
    --   end, opts)
    --
    --   -- Toggle DAP UI
    --   vim.keymap.set("n", "<leader>du", function()
    --     dapui.toggle()
    --   end, opts)
    end,
  },
}

