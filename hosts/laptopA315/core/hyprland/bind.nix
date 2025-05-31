[
    # general binds
    "$mainMod, Q, exec, $terminal"
    "$mainMod, C, killactive"
    "$mainMod, L, exec, hyprlock --immediate"
    "$mainMod, M, exec, uwsm stop"
    "$mainMod, E, exec, $fileManager"
    "$mainMod, V, togglefloating"
    "$mainMod, R, exec, $menu"
    "$mainMod, P, pseudo"           # dwindle
    "$mainMod, J, togglesplit"      # dwindle

    # Move focus with mainMod + arrow keys
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"

    # Switch workspaces with mainMod + [0-9]
    "$mainMod, 1, workspace, r~1"
    "$mainMod, 2, workspace, r~2"
    "$mainMod, 3, workspace, r~3"
    "$mainMod, 4, workspace, r~4"
    "$mainMod, 5, workspace, r~5"
    "$mainMod, 6, workspace, r~6"
    "$mainMod, 7, workspace, r~7"
    "$mainMod, 8, workspace, r~8"
    "$mainMod, 9, workspace, r~9"
    "$mainMod, 0, workspace, r~10"

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    "$mainMod SHIFT, 1, movetoworkspace, r~1"
    "$mainMod SHIFT, 2, movetoworkspace, r~2"
    "$mainMod SHIFT, 3, movetoworkspace, r~3"
    "$mainMod SHIFT, 4, movetoworkspace, r~4"
    "$mainMod SHIFT, 5, movetoworkspace, r~5"
    "$mainMod SHIFT, 6, movetoworkspace, r~6"
    "$mainMod SHIFT, 7, movetoworkspace, r~7"
    "$mainMod SHIFT, 8, movetoworkspace, r~8"
    "$mainMod SHIFT, 9, movetoworkspace, r~9"
    "$mainMod SHIFT, 0, movetoworkspace, r~10"

    # Scratch Workspace
    "$mainMod, S, togglespecialworkspace"
    "$mainMod SHIFT, s, movetoworkspace, special"

    # Scroll through workspaces with mainMod + Scroll
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
]
