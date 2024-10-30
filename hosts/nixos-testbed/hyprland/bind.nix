[
    # general binds
    "$mainMod, Q, exec, $terminal"
    "$mainMod, C, killactive"
    "$mainMod, M, exit"
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
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    "$mainMod, 1, movetoworkspace, 1"
    "$mainMod, 2, movetoworkspace, 2"
    "$mainMod, 3, movetoworkspace, 3"
    "$mainMod, 4, movetoworkspace, 4"
    "$mainMod, 5, movetoworkspace, 5"
    "$mainMod, 6, movetoworkspace, 6"
    "$mainMod, 7, movetoworkspace, 7"
    "$mainMod, 8, movetoworkspace, 8"
    "$mainMod, 9, movetoworkspace, 9"
    "$mainMod, 0, movetoworkspace, 10"

    # Scratch Workspace
    "$mainMod, S, togglespecialworkspace, magic"
    "$mainMod SHIFT, s, movetoworkspace, special:magic"

    # Scroll through workspaces with mainMod + Scroll
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
]
