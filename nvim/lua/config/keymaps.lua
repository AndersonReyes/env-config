-- Clear highlighted search results with Escape in normal mode.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Leave insert mode by typing j followed quickly by k.
-- The normal Escape key continues to work.
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Use Ctrl-Q to leave terminal mode.
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Open Codex or document the symbol under the cursor.
vim.keymap.set("n", "<leader>cc", "<cmd>Codex<CR>", {
  desc = "Open Codex",
})
vim.keymap.set("n", "<leader>cd", "<cmd>CodexDocumentSymbol<CR>", {
  desc = "Document symbol with Codex",
})
vim.keymap.set("n", "<leader>cw", "<cmd>CodexWindow<CR>", {
  desc = "Switch to Codex",
})

-- Navigate between open buffers.
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", {
  desc = "Next buffer",
})
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", {
  desc = "Previous buffer",
})
vim.keymap.set("n", "<leader>bl", "<cmd>buffer #<CR>", {
  desc = "Last-used buffer",
})

-- In the completion menu, Tab selects the next candidate. Otherwise it
-- inserts a normal tab according to the buffer's indentation settings.
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, desc = "Next completion or insert tab" })

-- Accept a selected completion with Enter. Otherwise, let nvim-autopairs
-- expand pairs such as {|} into an indented brace block.
vim.keymap.set("i", "<CR>", function()
  local autopairs = require("nvim-autopairs")

  if vim.fn.pumvisible() == 1 then
    local selected = vim.fn.complete_info({ "selected" }).selected

    if selected ~= -1 then
      return autopairs.esc("<C-y>")
    end

    return autopairs.esc("<C-e>") .. autopairs.autopairs_cr()
  end

  return autopairs.autopairs_cr()
end, { expr = true, desc = "Accept completion or insert line" })

-- Move between split windows with Ctrl plus h/j/k/l.
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
