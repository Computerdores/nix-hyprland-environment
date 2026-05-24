[
    # Media Keys
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPause, exec, playerctl play-pause"
    ", XF86AudioNext,  exec, playerctl next"
    ", XF86AudioPrev,  exec, playerctl previous"
    ", XF86AudioStop,  exec, playerctl stop"
    ", XF86AudioMute,  exec, playerctl pause" # should be mute, but doesn't work
]
