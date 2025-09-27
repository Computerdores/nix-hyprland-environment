
# Computerdores' NixOS Flake
## PRs to get back to
- [MaxVerevkin/i3bar-river#47](https://github.com/MaxVerevkin/i3bar-river/pull/47)
- [MaxVerevkin/i3bar-river#48](https://github.com/MaxVerevkin/i3bar-river/pull/48)
- [MaxVerevkin/i3bar-river#49](https://github.com/MaxVerevkin/i3bar-river/pull/49)

## ToDo
- terminal file picker (one of the [termfilechooser forks](https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser) maybe)
- nmtui theming (e.g. `NEWT_COLORS='root=white,default' nmtui`)
- bar
  - tray icons
- yazi: gruvbox
- fix backlight control for external monitors
- drun script for `nix run nixpkgs#<name>`
- fn keys
- nvim full IDE
- nvim: investigate lazy git plugin
- nvim: macro for stage_hunk
- investigate nix profiles
- https://nixos.wiki/wiki/flakes#Pinning_the_registry_to_the_system_pkgs_on_NixOS
- fix: nixos-rebuild switch should set default boot option (this is a bug, see docs; `--install-bootloader` doesn't fix it)

### Software
- Thunderbird
- calculator
- Ghidra
  - Debugger
- hypridle
- Signal Desktop
- spicetify
- Telegram Desktop
- KDE Connect

## FAQ
> The `nixos-rebuild` complains that home-manager couldn't start and that certain files should be removed or the backup file extension set, but it doesn't say which files are the problem. How do I find those files?

Run this to see the full log and findout where the conflict is occuring:
`journalctl --unit home-manager-<user>.service`

> How to inspect the output of the flake?

Either `nixos-rebuild repl` or `nix repl` + `:lf /etc/nixos`.

## Packages
- [sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme) (a series of SDDM themes by [KeyitDev](https://github.com/Keyitdev); self packaged)
- [utiltool](https://github.com/Computerdores/utiltool) (a collection of utilities written for this flake)

## Credits
- various posts on [r/unixporn](https://www.reddit.com/r/unixporn/) for great amounts of inspiration

### Wallpapers
The Wallpapers at `common/wallpapers/**` are from various people around the web, most notably [Aenami](https://www.artstation.com/aenamiart)
<details>

|               Path               |                                   Artist                                   |
|----------------------------------|----------------------------------------------------------------------------|
| `aenami/*`                       | [Aenami](https://www.artstation.com/aenamiart)                             |
| `abandoned_satellite_dishes.jpg` | [Isaac Yeram Kim](https://www.artstation.com/isaacyeramkim)                |
| `escaping_the_well.jpg`          | N/A                                                                        |
| `fedex_cargo_ship.jpg`           | [Plumm](https://www.humanart.cz/portfolio/Plumm)                           |
| `ghost_in_the_shell.jpg`         | N/A                                                                        |
| `the_neon_shallows.png`          | [Leiko](https://www.deviantart.com/leikoi/art/The-Neon-Shallows-823330548) |
| `the_wormworld_saga_edited.jpg`  | [Daniel Lieske](https://daniellieske.artstation.com/)                      |

If you know the artist for one of the wallpapers where it says "N/A", please let me know!
</details>
