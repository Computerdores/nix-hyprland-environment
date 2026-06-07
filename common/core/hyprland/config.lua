local terminal    = "kitty"
local fileManager = terminal .. " yazi"
local menu        = "wofi --show drun"

-- general binds
hl.bind("SUPER + Q",             hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + C",             hl.dsp.window.close())
hl.bind("SUPER + B",             hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + M",             hl.dsp.exec_cmd("hyprshutdown"))
hl.bind("SUPER + E",             hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V",             hl.dsp.window.float())
hl.bind("SUPER + R",             hl.dsp.exec_cmd(menu))
hl.bind("SUPER + P",             hl.dsp.window.pseudo()) -- dwindle
hl.bind("SUPER + N",             hl.dsp.layout("togglesplit")) -- dwindle
hl.bind("SUPER + Y",             hl.dsp.exec_cmd("hyprshot -o ~/pictures -m region"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"))

-- Global Hotkeys
hl.bind("F24", hl.dsp.pass({ window = "class:discord" }))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + left",          hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right",         hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",            hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",          hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + H",             hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L",             hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K",             hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J",             hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind("SUPER + 1",             hl.dsp.focus({ workspace = "r~1" }))
hl.bind("SUPER + 2",             hl.dsp.focus({ workspace = "r~2" }))
hl.bind("SUPER + 3",             hl.dsp.focus({ workspace = "r~3" }))
hl.bind("SUPER + 4",             hl.dsp.focus({ workspace = "r~4" }))
hl.bind("SUPER + 5",             hl.dsp.focus({ workspace = "r~5" }))
hl.bind("SUPER + 6",             hl.dsp.focus({ workspace = "r~6" }))
hl.bind("SUPER + 7",             hl.dsp.focus({ workspace = "r~7" }))
hl.bind("SUPER + 8",             hl.dsp.focus({ workspace = "r~8" }))
hl.bind("SUPER + 9",             hl.dsp.focus({ workspace = "r~9" }))
hl.bind("SUPER + 0",             hl.dsp.focus({ workspace = "r~10" }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + 1",     hl.dsp.window.move({ workspace = "r~1" }))
hl.bind("SUPER + SHIFT + 2",     hl.dsp.window.move({ workspace = "r~2" }))
hl.bind("SUPER + SHIFT + 3",     hl.dsp.window.move({ workspace = "r~3" }))
hl.bind("SUPER + SHIFT + 4",     hl.dsp.window.move({ workspace = "r~4" }))
hl.bind("SUPER + SHIFT + 5",     hl.dsp.window.move({ workspace = "r~5" }))
hl.bind("SUPER + SHIFT + 6",     hl.dsp.window.move({ workspace = "r~6" }))
hl.bind("SUPER + SHIFT + 7",     hl.dsp.window.move({ workspace = "r~7" }))
hl.bind("SUPER + SHIFT + 8",     hl.dsp.window.move({ workspace = "r~8" }))
hl.bind("SUPER + SHIFT + 9",     hl.dsp.window.move({ workspace = "r~9" }))
hl.bind("SUPER + SHIFT + 0",     hl.dsp.window.move({ workspace = "r~10" }))

-- Scratch Workspace
hl.bind("SUPER + S",             hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S",     hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse binds
hl.bind("SUPER + mouse:272",     hl.dsp.window.drag(),                                          { mouse = true })
hl.bind("SUPER + mouse:273",     hl.dsp.window.resize(),                                        { mouse = true })

-- Lockscreen enabled binds
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),  { locked = true })
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),  { locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"),                       { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"),                       { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),                             { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),                         { locked = true })
hl.bind("XF86AudioStop",         hl.dsp.exec_cmd("playerctl stop"),                             { locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("playerctl pause"),                            { locked = true }) -- should be mute, but doesn't work

-- env vars
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- animations
hl.curve("windowCurve", {
  type = "bezier",
  points = {
      {
          0.05,
          0.9
      },
      {
          0.1,
          1.05
      }
  },
})

hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 7,
  bezier = "windowCurve"
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 7,
  bezier = "default",
  style = "popin 80%"
})
hl.animation({
  leaf = "border",
  enabled = true,
  speed = 10,
  bezier = "default"
})
hl.animation({
  leaf = "borderangle",
  enabled = true,
  speed = 8,
  bezier = "default"
})
hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 7,
  bezier = "default"
})
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 6,
  bezier = "default"
})
