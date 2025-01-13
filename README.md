# docker

Build/test containers.

| tag                                               | description       |
| ------------------------------------------------- | ----------------- |
| [base](./base/Dockerfile)                         | base image        |
| [mdbook](./mdbook/Dockerfile)                     | base+[mdbook]     |
| [shell-bash-ble](./shell-bash-ble/Dockerfile)     | base+[bash-ble]   |
| [shell-elvish](./shell-elvish/Dockerfile)         | base+[elvish]     |
| [shell-fish](./shell-fish/Dockerfile)             | base+[fish]       |
| [shell-nushell](./shell-nushell/Dockerfile)       | base+[nushell]    |
| [shell-oil](./shell-oil/Dockerfile)               | base+[oil]        |
| [shell-powershell](./shell-powershell/Dockerfile) | base+[powershell] |
| [shell-xonsh](./shell-xonsh/Dockerfile)           | base+[xonsh]      |
| [shell-zsh](./shell-zsh/Dockerfile)               | base+[zsh]        |
| [shell](./shell/Dockerfile)                       | base+shell-*      |
| [vhs](./vhs/Dockerfile)                           | shell+[vhs]       |

Additional init file instruction (e.g. `.bashrc`) can be set with:

| Environment      |
| ---------------- |
| `$RC_BASH`       |
| `$RC_BASH_BLE`   |
| `$RC_ELVISH`     |
| `$RC_FISH`       |
| `$RC_NUSHELL`    |
| `$RC_OIL`        |
| `$RC_POWERSHELL` |
| `$RC_XONSH`      |
| `$RC_ZSH`        |

[mdbook]:https://github.com/rust-lang/mdBook
[bash-ble]:https://github.com/akinomyoga/ble.sh
[elvish]:https://github.com/elves/elvish
[fish]:https://github.com/fish-shell/fish-shell
[nushell]:https://github.com/nushell/nushell
[oil]:https://github.com/oils-for-unix/oils
[powershell]:https://github.com/PowerShell/PowerShell
[xonsh]:https://github.com/xonsh/xonsh
[zsh]:https://www.zsh.org/
[vhs]:https://github.com/charmbracelet/vhs
