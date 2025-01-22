# ToDo
- [ ] EWW: battery indicator time estimate tooltip
- [ ] Credits section
- [ ] Ghidra
- [ ] Thunderbird

# FAQ
The `nixos-rebuild` complains that home-manager couldn't start and that certain files should be removed or the backup file extension set, but it doesn't say which files are the problem. How do I find those files?

Run this to see the full log:
`journalctl --unit home-manager-jann.service`
