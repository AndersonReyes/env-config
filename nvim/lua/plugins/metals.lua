return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "java" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    return require("metals").bare_config()
  end,
  config = function(self, metals_config)
    local group = vim.api.nvim_create_augroup("nvim-metals", {
      clear = true,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      group = group,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
    })
  end,
}
