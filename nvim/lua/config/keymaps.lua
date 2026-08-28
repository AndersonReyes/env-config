-- Clear highlighted search results with Escape in normal mode.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Leave insert mode by typing j followed quickly by k.
-- The normal Escape key continues to work.
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- In the completion menu, Tab selects the next candidate. Otherwise it
-- inserts a normal tab according to the buffer's indentation settings.
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, desc = "Next completion or insert tab" })

-- Accept the selected completion with Enter. When the menu is not visible,
-- Enter continues to insert a new line.
vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, desc = "Accept completion or insert line" })

-- Move between split windows with Ctrl plus h/j/k/l.
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
