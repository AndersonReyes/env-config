-- Each table in this returned list describes one plugin.
return {
  -- Detect indentation from EditorConfig, modelines, and surrounding files.
  { "tpope/vim-sleuth" },

  -- Gruvbox provides the editor's color palette and highlights.
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  -- Treesitter provides parser-based highlighting and indentation.
  {
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
  },

  -- Telescope provides interactive file, text, buffer, and help searching.
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Search text",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Help",
      },
      {
        "<leader>fr",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Recent files",
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Search current buffer",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.stdpath("config"),
          })
        end,
        desc = "Find config files",
      },
    },
    opts = {
      defaults = {
        -- Compact deep project paths while keeping the filename and its
        -- immediate parent directory readable.
        path_display = {
          shorten = {
            len = 1,
            exclude = { -1, -2 },
          },
        },
      },
    },
  },
}
