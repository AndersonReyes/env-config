-- Neovim starts here.
-- Keep this file small: each require loads one focused part of the config.

-- Options includes the leader keys and must load before lazy.nvim so plugin
-- key mappings use the correct leader.
require("config.options")

-- Load mappings that do not belong to a specific plugin.
require("config.keymaps")

-- Bootstrap lazy.nvim and load the plugin specifications.
require("config.lazy")
