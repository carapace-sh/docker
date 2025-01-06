export STARSHIP_SHELL=zsh
eval "$(starship init zsh)"

zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' 

autoload -U compinit && compinit 
