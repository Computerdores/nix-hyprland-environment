# Computerdores' NixOS Flake
## ToDo
- [ ] nnn file picker integration for firefox
- [ ] nano syntax highlighting for: eww
- [ ] `alias ssh=kitten ssh`
- [ ] List of packages
- [ ] eww: fix the workspaces widget?
- [ ] sound control
- [ ] network control
- [ ] bluetooth control
- [ ] eww: backlight control
- [ ] eww: tray icons
- [ ] eww: pressing button in power menu should close the power menu

### Software
- [ ] Thunderbird
- [ ] calculator
- [ ] Ghidra
- [ ] hypridle
  - [ ] eww button to toggle
- [ ] Signal Desktop

### Done
<details>
<summary>Done</summary>

- [x] EWW: battery indicator time estimate tooltip
- [x] Credits section
- [x] ImHex
- [x] pwndbg
</details>

## FAQ
> The `nixos-rebuild` complains that home-manager couldn't start and that certain files should be removed or the backup file extension set, but it doesn't say which files are the problem. How do I find those files?

Run this to see the full log and findout where the conflict is occuring:
`journalctl --unit home-manager-<user>.service`

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
