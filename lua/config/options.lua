-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_array_whitespace_error = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_space_tab_error = 1
vim.g.go_highlight_trailing_whitespace_error = 1
vim.g.go_highlight_function_parameters = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_highlight_variable_assignments = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_diagnostic_errors = 1
vim.g.go_highlight_diagnostic_warnings = 1

vim.g.go_fmt_autosave = 1

vim.g.go_fmt_command = "gofmt"
vim.g.go_auto_sameids = 1
vim.g.go_def_mapping_enabled = 1

vim.opt.winbar = "%=%m %f "
