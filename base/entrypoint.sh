#!/bin/bash
[ -z "$RC_BASH" ]        || echo "$RC_BASH"        >> /root/.bashrc
[ -z "$RC_BASH_BLE" ]    || echo "$RC_BASH_BLE"    >> /root/.config/bash-ble/blerc
[ -z "$RC_ELVISH" ]      || echo "$RC_ELVISH"      >> /root/.config/elvish/rc.elv
[ -z "$RC_FISH" ]        || echo "$RC_FISH"        >> /root/.config/fish/config.fish
[ -z "$RC_NUSHELL" ]     || echo "$RC_NUSHELL"     >> /root/.config/nushell/config.nu
[ -z "$RC_NUSHELL_ENV" ] || echo "$RC_NUSHELL_ENV" >> /root/.config/nushell/env.nu
[ -z "$RC_OIL" ]         || echo "$RC_OIL"         >> /root/.config/oils/oshrc
[ -z "$RC_POWERSHELL" ]  || echo "$RC_POWERSHELL"  >> /root/.config/powershell/profile.ps1
[ -z "$RC_TCSH" ]        || echo "$RC_TCSH"        >> /root/.tcshrc
[ -z "$RC_XONSH" ]       || echo "$RC_XONSH"       >> /root/.config/xonsh/rc.xsh
[ -z "$RC_ZSH" ]         || echo "$RC_ZSH"         >> /root/.zshrc

exec "$@"
