# Prompt
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\spaceship.omp.json" | Invoke-Expression

# Icons
if (!(Get-Module -Name Terminal-Icons)) {
	Install-Module -Name Terminal-Icons
	Import-Module -Name Terminal-Icons
} else {
	Import-Module -Name Terminal-Icons
}

# Fzf
if (!(Get-Module -Name PSFzf)) {
	Install-Module -Name PSFzf
	Import-Module -Name PSFzf
} else {
	Import-Module -Name PSFzf
}

Set-PSFzfOption -PSReadLineChordProvidor 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView

# My Custom Scripts
Import-Module "$env:USERPROFILE\.config\powershell\scripts.psm1"

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
