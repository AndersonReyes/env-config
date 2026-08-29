-- Treesitter provides parser-based highlighting and indentation.
return {
  "nvim-treesitter/nvim-treesitter",

  -- The current main branch targets Neovim 0.12 and cannot be lazy-loaded.
  lazy = false,

  -- Keep installed parsers synchronized with the plugin's query files.
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")

    -- Install missing parsers. Existing up-to-date parsers are left alone.
    treesitter.install({
      "bash",
      "css",
      "go",
      "html",
      "java",
      "javascript",
      "lua",
      "markdown",
      "python",
      "rust",
      "scala",
      "typescript",
      "vim",
      "vimdoc",
    })

    -- Enable Neovim's Treesitter highlighting and the plugin's experimental
    -- indentation expression for supported file types.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "css",
        "go",
        "help",
        "html",
        "java",
        "javascript",
        "lua",
        "markdown",
        "python",
        "rust",
        "scala",
        "sh",
        "typescript",
        "vim",
      },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
