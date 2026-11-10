set-env STARSHIP_SHELL elvish
set edit:prompt = { starship prompt }
set edit:rprompt = { }

eval (tt _carapace elvish | slurp)
