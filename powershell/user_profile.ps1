# Prompt
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\ys.omp.json" | Invoke-Expression

# PSReadLine
Import-Module -Name Terminal-Icons
Import-Module -Name PSFzf
Set-PSFzfOption -PSReadLineChordProvidor 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# My Custom Scripts (i.e. touch, which, etc.)
Import-Module "$env:USERPROFILE\.config\powershell\scripts.psm1"

# My Custom Scripts (i.e. touch, which, etc.)
Import-Module "$env:USERPROFILE\.config\powershell\scripts.psm1"

# Alias
Set-Alias v nvim
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias gs get-gitstatus
Set-Alias grep findstr
Set-Alias tig "$env:USERPROFILE\scoop\apps\git\current\usr\bin\tig.exe"
Set-Alias less "$env:USERPROFILE\scoop\apps\git\current\usr\bin\less.exe"
Set-Alias cat bat
Set-Alias ps procs
Set-Alias open explorer