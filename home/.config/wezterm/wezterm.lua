-- https://wezfurlong.org/wezterm/config/files.html
-- https://wezfurlong.org/wezterm/config/lua/general.html

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("LiterationMono Nerd Font", { weight = "Bold" })
config.font_size = 14.0
config.cell_width = 0.9

config.color_scheme = "Dark"
config.color_schemes = {
  ["Dark"] = {
    background = "#000000",
    foreground = "#c5c5c5",
    -- dim_foreground = "#a0a0a0",
    -- bright_foreground = "#e0e0e0",
    ansi = {
      "#000000", -- black
      "#ec2424", -- red
      "#00d400", -- green
      "#d4d400", -- yellow
      "#80a0ff", -- blue
      "#e236e2", -- magenta
      "#00d4d4", -- cyan
      "#c5c5c5", -- white
    },
    brights = {
      "#666666", -- black
      "#ff7070", -- red
      "#60fa60", -- green
      "#fffb68", -- yellow
      "#7ebdff", -- blue
      "#ff96eb", -- magenta
      "#60ffff", -- cyan
      "#e0e0e0", -- white
    }
  }
}

-- config.force_reverse_video_cursor = true
config.window_background_opacity = 0.85

return config
