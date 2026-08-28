-- Compute lazy.nvim's installation directory inside Neovim's data directory.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Download lazy.nvim only when it is not already installed.
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Could not install lazy.nvim:\n" .. output)
  end
end

-- Make require("lazy") available.
vim.opt.rtp:prepend(lazypath)

-- Load every plugin specification returned from lua/plugins/*.lua.
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
