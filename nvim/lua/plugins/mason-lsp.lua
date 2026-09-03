return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls", "rust_analyzer", "gopls",
      "pyright", "jdtls",
    },
  },
  dependencies = {
    {"mason-org/mason.nvim", opts = {}},
    "neovim/nvim-lspconfig"
  },
  config = function(_, opts)
    -- Teach lua_ls about Neovim's LuaJIT runtime and API so the `vim`
    -- global is recognized and Neovim API completion is available.
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      },
    })

    require("mason-lspconfig").setup(opts)
  end,
}
