-- Leader keys begin custom mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Show absolute and cursor-relative line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse support in every mode.
vim.opt.mouse = "a"

-- Share copy and paste operations with the operating-system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Ignore search case unless the search contains an uppercase letter.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Open new horizontal splits below and vertical splits to the right.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable 24-bit terminal colors.
vim.opt.termguicolors = true

-- Preserve undo history after closing a file.
vim.opt.undofile = true

-- Reduce plugin event delay and mapping-sequence timeout.
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Keep nearby lines visible while scrolling vertically and horizontally.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Reserve a permanent column for diagnostic and version-control signs.
vim.opt.signcolumn = "yes"

-- Highlight the screen line containing the cursor.
vim.opt.cursorline = true

-- Ask for confirmation instead of abandoning unsaved changes.
vim.opt.confirm = true

-- Preview substitutions in a split while typing a :substitute command.
vim.opt.inccommand = "split"

-- Keep the visible text stable when opening or closing splits.
vim.opt.splitkeep = "screen"

-- Limit completion pop-up menus to ten entries.
vim.opt.pumheight = 10

-- Show command-line matches and complete the longest common portion first.
vim.opt.wildmode = { "longest:full", "full" }

-- Give floating windows a consistent rounded border.
vim.opt.winborder = "rounded"

-- Wrap long lines at the current window width without splitting words.
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Show completion suggestions automatically while typing.
vim.opt.autocomplete = true

-- Source suggestions only from the current buffer, buffers visible in other
-- windows, and other loaded buffers. Do not use LSP, files, or dictionaries.
vim.opt.complete = { ".", "w", "b" }

-- Show a fuzzy-matched menu without inserting or selecting a candidate.
-- Display extra candidate information in a popup when it is available.
vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }

-- Enable autocomplete only in ordinary editable buffers. This excludes
-- Telescope prompts, help, quickfix, terminal, and other plugin buffers.
local autocomplete_group = vim.api.nvim_create_augroup("buffer_autocomplete", {
  clear = true,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = autocomplete_group,
  callback = function(event)
    local buffer = vim.bo[event.buf]
    buffer.autocomplete = buffer.buftype == "" and buffer.modifiable
  end,
})

-- Use one statusline across the bottom of Neovim instead of one per split.
vim.opt.laststatus = 3

-- Statusline contents, from left to right:
--   relative file path; help, modified, and read-only flags;
--   filetype; cursor line and column; percentage through the file.
-- %< marks where the file path may be truncated when space is limited.
-- %= separates left-aligned content from right-aligned content.
vim.opt.statusline = table.concat({
  " ",
  "%<%f",
  " %h%m%r",
  "%=",
  "%y",
  "  %l:%c",
  "  %P ",
})
