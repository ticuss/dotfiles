-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-j>", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader>chc", "<cmd>ChatGPT<cr>", { desc = "Chat with GPT-3" })
vim.keymap.set("n", "<leader>che", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "GPT Edit With Instructions" })
vim.keymap.set("v", "<leader>chrt", "<cmd>ChatGPTRun add_tests<cr>", { desc = "GPT add tests" })
vim.keymap.set("v", "<leader>chra", "<cmd>ChatGPTRun code_readability_analysis<cr>",
    { desc = "GPT Readability Analysis" })
vim.keymap.set("v", "<leader>chrc", "<cmd>ChatGPTRun complete_code<cr>", { desc = "GPT Complete Code" })
vim.keymap.set("v", "<leader>chrd", "<cmd>ChatGPTRun docstring<cr>", { desc = "GPT Docstring" })
vim.keymap.set("v", "<leader>chre", "<cmd>ChatGPTRun explain_code<cr>", { desc = "GPT Explain Code" })
vim.keymap.set("v", "<leader>chro", "<cmd>ChatGPTRun optimize_code<cr>", { desc = "GPT Optimize Code" })
vim.keymap.set("v", "<leader>chrs", "<cmd>ChatGPTRun summarize<cr>", { desc = "GPT summarize" })
vim.keymap.set("v", "<leader>chrf", "<cmd>ChatGPTRun fix_bugs<cr>", { desc = "GPT Fix Bugs" })
