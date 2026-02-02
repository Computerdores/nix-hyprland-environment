
# Computerdores' NixOS Flake
## PRs to get back to
- [MaxVerevkin/i3bar-river#47](https://github.com/MaxVerevkin/i3bar-river/pull/47)
- [MaxVerevkin/i3bar-river#48](https://github.com/MaxVerevkin/i3bar-river/pull/48)
- [MaxVerevkin/i3bar-river#49](https://github.com/MaxVerevkin/i3bar-river/pull/49)

## ToDo
- yazi: gruvbox
- fix backlight control for external monitors
- fn keys
- nvim full IDE
- nvim: investigate lazy git plugin
- pywal16?
- sddm virtual keyboard doesn't do anything
- localsend: sending from laptop to phone is broken in weird way (tries to connect to NAS IP for some fkn reason)
- make plymouth-figlet derivation into module that adds theme package to `boot.plymouth.themePackages` and configures derivation when `boot.plymouth.theme == "figlet"`
- ghidra: fix debugger
- nwg-displays?
- nix profiles?

### High Effort / Wait Required
- terminal file picker (one of the [termfilechooser forks](https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser) maybe)
- tray icons in bar
- matugen for material-you color gen / theming
- themed luks unlock (wait required; see `common/core/plymouth.nix`)
- nix-run helper: provide all nixpkgs as options in dmenu chooser (wait/work required; wofi is too slow)
- remove ckb-next workaround (wait required; see `host/laptopA315/configuration.nix`)
- switch SDDM back to wayland once stable

### Software
- calculator
- Signal Desktop
- Telegram Desktop
- KDE Wallet

## FAQ
> The `nixos-rebuild` complains that home-manager couldn't start and that certain files should be removed or the backup file extension set, but it doesn't say which files are the problem. How do I find those files?

Run this to see the full log and findout where the conflict is occuring:
`journalctl --unit home-manager-<user>.service`

> How to inspect the output of the flake?

Either `nixos-rebuild repl` or `nix repl` + `:lf /etc/nixos`.

> `nixos-rebuild switch` isn't setting the default boot entry anymore

I believe this is caused by pressing 'd' on boot to set the default boot entry.
To fix: Go into `/boot/loader/loader.conf` and remove the line starting with `default `; rerun `nixos-rebuild switch`.
It should now be set to the latest generation and should automatically be set in the future.

> I want to execute some stuff in the same environment as another program

(This process is quite complicated; there is probably an easier way PLEASE let me know if you know how)

Open top/htop/btop/etc. and look for the program.
Its parent process should be `bwrap`, copy/remember the pid of that process.
Run `cat /proc/<pid>/cmdline | tr '\0' ' '`; this will print the command to execute that process.
Typically the last param will be the path to a script, copy that script.
At the end of that script there should be an `exec` command that references the program binary, replace the program binary path with bash.
Now take the bwrap command and replace the path to the original script with the absolute path of your modified script and execute it.
You are now in the same environment.

> `sudo nixos-rebuild ...` fails to pull a git repo via ssh, but my ssh key works normally otherwise, what do I do?

Run `sudo -E nixos-rebuild ...` once instead, that way the `SSH_AUTH_SOCK` environment variable will be passed through correctly and the git pull via ssh works correctly.

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
