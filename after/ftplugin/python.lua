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

local dap = require('dap')
dap.adapters.python = {
    type = 'executable',
    command = get_python_path(),
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = get_python_path,
    },
    {
        type = 'python',
        request = 'launch',
        name = 'Debug Flask',


        module = "flask",
        args = { 'run', '--no-debugger' },
        jinja = true,
        cwd = '${workspaceFolder}',
        justMyCode = true,


        -- This assumes your Flask app is running on localhost:5000
        -- Change as needed for your specific Flask app configuration

        stopOnEntry = false,
        pythonPath = get_python_path,
        env = {
            FLASK_APP = 'run.py',
            FLASK_ENV = 'development',
            PYTHONUNBUFFERED = 'true'
        },
    },
}
