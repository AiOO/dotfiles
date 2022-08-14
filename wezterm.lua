local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback {
    {
      family='Comic Code Ligatures',
      weight="Medium",
    },
    'D2Coding',
  },
  font_size = 14.0,
  line_height = 1.1,
  color_scheme = 'Thayer Bright',
}
