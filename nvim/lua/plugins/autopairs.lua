-- Insert matching parentheses, brackets, braces, and quotes. Enter handling
-- is disabled here because keymaps.lua integrates it with autocomplete.
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    map_cr = false,
  },
}
