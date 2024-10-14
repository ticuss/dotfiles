-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-j>", "<Nop>", { silent = true })

-- vim.keymap.set("n", "<leader>chc", "<cmd>ChatGPT<cr>", { desc = "Chat with GPT-3" })
-- vim.keymap.set("n", "<leader>che", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "GPT Edit With Instructions" })
-- vim.keymap.set("v", "<leader>chrt", "<cmd>ChatGPTRun add_tests<cr>", { desc = "GPT add tests" })
-- vim.keymap.set(
--   "v",
--   "<leader>chra",
--   "<cmd>ChatGPTRun code_readability_analysis<cr>",
--   { desc = "GPT Readability Analysis" }
-- )
-- vim.keymap.set("v", "<leader>chrc", "<cmd>ChatGPTRun complete_code<cr>", { desc = "GPT Complete Code" })
-- vim.keymap.set("v", "<leader>chrd", "<cmd>ChatGPTRun docstring<cr>", { desc = "GPT Docstring" })
-- vim.keymap.set("v", "<leader>chre", "<cmd>ChatGPTRun explain_code<cr>", { desc = "GPT Explain Code" })
-- vim.keymap.set("v", "<leader>chro", "<cmd>ChatGPTRun optimize_code<cr>", { desc = "GPT Optimize Code" })
-- vim.keymap.set("v", "<leader>chrs", "<cmd>ChatGPTRun summarize<cr>", { desc = "GPT summarize" })
-- vim.keymap.set("v", "<leader>chrf", "<cmd>ChatGPTRun fix_bugs<cr>", { desc = "GPT Fix Bugs" })

vim.keymap.set("n", "<leader>nn", "<cmd>Neorg workspace notes<cr>", { desc = "Open notes" })

-- Open notes
vim.keymap.set("n", "<leader>nn", "<cmd>Neorg workspace notes<cr>", { desc = "Open notes" })

-- Obsidian commands under leader + o
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Create a new note in Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick switch to another note" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianFollowLink<cr>", { desc = "Follow link to note" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Show backlinks for the current note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search for notes" })
vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", { desc = "Switch workspace" })
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Rename note" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToggleCheckbox<cr>", { desc = "Toggle checkbox" })

vim.keymap.set("n", "<leader>fo", function()
  print("Opening Firefox...")
  vim.fn.jobstart({ "open", "-a", "Firefox" })
end, { desc = "Open Firefox" })
-- vim.fn.jobstart({ "open", "-a", "Firefox", "-g", url })

vim.keymap.set("n", "<leader>fos", function()
  -- Prompt the user for input
  local search_query = vim.fn.input("DuckDuckGo search: ")

  -- If the input is not empty, proceed
  if search_query ~= "" then
    -- Encode the search query for a URL
    local search_url = "https://duckduckgo.com/?q=" .. vim.fn.escape(search_query, " ")

    -- Print message to confirm the action
    print("Searching DuckDuckGo for: " .. search_query)

    -- Open Firefox with the search URL
    vim.fn.jobstart({ "open", "-a", "Firefox", search_url })
  else
    print("Search query is empty.")
  end
end, { desc = "Search DuckDuckGo in Firefox" })
