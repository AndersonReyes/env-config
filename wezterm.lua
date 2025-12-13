local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


config.color_scheme = 'Gruvbox dark, medium (base16)'
config.font_size = 10
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 20

config.wsl_domains = {
  {
    -- The name of this specific domain.  Must be unique amonst all types
    -- of domain in the configuration file.
    name = 'WSL:DEFAULT',

    -- The name of the distribution.  This identifies the WSL distribution.
    -- It must match a valid distribution from your `wsl -l -v` output in
    -- order for the domain to be useful.
    distribution = 'Debian',

    -- The username to use when spawning commands in the distribution.
    -- If omitted, the default user for that distribution will be used.

    -- username = "hunter",

    -- The current working directory to use when spawning commands, if
    -- the SpawnCommand doesn't otherwise specify the directory.

    -- default_cwd = "/tmp"

    -- The default command to run, if the SpawnCommand doesn't otherwise
    -- override it.  Note that you may prefer to use `chsh` to set the
    -- default shell for your user inside WSL to avoid needing to
    -- specify it here

    -- default_prog = {"fish"}
  },
}

config.default_domain = "WSL:DEFAULT"

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  {
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ReloadConfiguration,
  },
  -- Create a new tab in the same domain as the current pane.
  -- This is usually what you want.
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  { key = '[', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
  { key = ']', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },

  -- This will create a new split and run your default program inside it
  {
    key = 'h',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  -- This will create a new split vertically and run your default program inside it
  {
    key = 'v',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },

  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection 'Next',
  }
}


return config
