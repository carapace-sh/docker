$env:STARSHIP_SHELL = 'powershell'
Invoke-Expression (&starship init powershell)

Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
