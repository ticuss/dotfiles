local function get_python_path()
  -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
  -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
  -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    return cwd .. '/venv/bin/python'
  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    return cwd .. '/.venv/bin/python'
  else
    return '/Users/constantinbogdanas/.pyenv/shims/python'
  end
end

return {
  "mfussenegger/nvim-dap",
  lazy = true,
  keys = {
    {
      "<leader>db",
      "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dn",
      "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
      desc = "Conditional breakpoint",
    },
    {
      "<leader>dx",
      "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
      desc = "Clear all breakpoints",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<leader>dC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run To Cursor",
    },
    {
      "<leader>dd",
      function()
        require("dap").disconnect()
      end,
      desc = "Disconnect",
    },
    {
      "<leader>dg",
      function()
        require("dap").session()
      end,
      desc = "Get Session",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause()
      end,
      desc = "Pause",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle Repl",
    },
    {
      "<leader>ds",
      function()
        require("dap").continue()
      end,
      desc = "Start",
    },
    {
      "<leader>dq",
      function()
        require("dap").close()
      end,
      desc = "Quit",
    },
    {
      "<leader>dU",
      function()
        require("dapui").toggle({ reset = true })
      end,
      desc = "Toggle UI",
    },
  },
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap" },
      opts = {},
      init = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup(get_python_path())
      end,
    },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
    {
      "Weissle/persistent-breakpoints.nvim",
      opts = {
        load_breakpoints_event = { "BufReadPost" },
      }
    },
    --[[ and {
            "jay-babu/mason-nvim-dap.nvim",
            opts = {
                ensure_installed = { "python" },
                automatic_setup = true,
            },
            init = function()
              require("mason-nvim-dap").setup_handlers()
            end,
        },--]]
  },
}
