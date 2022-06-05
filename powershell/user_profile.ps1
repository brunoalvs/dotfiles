# Prompt
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\spaceship.omp.json" | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PSFzfOption -PSReadLineChordProvidor 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

# My Custom Scripts
Import-Module "C:\Users\hello\.config\powershell\scripts.psm1"

# Alias
Set-Alias v nvim
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias gs get-gitstatus
Set-Alias grep findstr
Set-Alias tig 'C:\Users\hello\scoop\apps\git\current\usr\bin\tig.exe'
Set-Alias less 'C:\Users\hello\scoop\apps\git\current\usr\bin\less.exe'
Set-Alias cat bat
Set-Alias ps procs
Set-Alias open explorer

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
