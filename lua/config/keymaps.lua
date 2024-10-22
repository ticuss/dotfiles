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

-- Open Firefox
vim.keymap.set("n", "<leader>foo", function()
  print("Opening Firefox...")
  vim.fn.jobstart({ "open", "-a", "Firefox" })
end, { desc = "Open Firefox" })

-- Open Firefox with DuckDuckGo search

vim.keymap.set("n", "<leader>fos", function()
  local search_query = vim.fn.input("DuckDuckGo search: ")

  if search_query ~= "" then
    local search_url = "https://duckduckgo.com/?q=" .. vim.fn.escape(search_query, " ")

    print("Searching DuckDuckGo for: " .. search_query)

    vim.fn.jobstart({ "open", "-a", "Firefox", search_url })
  else
    print("Search query is empty.")
  end
end, { desc = "Search DuckDuckGo in Firefox" })

--Open Firefox with DuckDuckGo search using yanked text

vim.keymap.set("n", "<leader>fop", function()
  local yanked_text = vim.fn.getreg('"')
  if yanked_text ~= "" then
    local query = vim.fn.escape(yanked_text, " ")
    local url = "https://duckduckgo.com/?q=" .. query
    vim.fn.jobstart({ "open", url })
  else
    print("No text yanked!")
  end
end, { desc = "Search DuckDuckGo with yanked text" })
