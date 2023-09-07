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
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        -- Here you can specify the settings for the adapter, i.e.
        runner = "pytest",
        python = get_python_path(),
        dap = { justMyCode = false },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup(get_python_path())
    end,
    opts = function()
      local dap = require("dap")
      dap.configurations.python = dap.configurations.python or {}
      table.insert(dap.configurations.python, {
        name = 'Flask app',
        type = 'python',
        request = 'launch',
        module = 'flask',
        envFile = "${workspaceFolder}/.env",
        env = {
          FLASK_APP = "run.py",
          FLASK_ENV = "development",
        },
        jinja = true,
        args = { 'run', '--no-debugger' },
      })
    end
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    opts = {
      load_breakpoints_event = { "BufReadPost" },
    }
  }
}
