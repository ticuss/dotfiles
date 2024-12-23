-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-j>", "<Nop>", { silent = true })

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
