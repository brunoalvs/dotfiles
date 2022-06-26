function copyPowerShellConfigFiles () {
    Write-Information "Moving Powershell config files..."
    Copy-Item ".\powershell" -Destination "$env:USERPROFILE\.config\powershell" -Recurse
    Write-Information "Powershell config moved! Please, restart your terminal."
}

function createProfile () {
    Write-Information ". $env:USERPROFILE\.config\powershell\user_profile.ps1" 6> $PROFILE
}

function InstallDependenciesWithScoop () {
    Write-Host "Installing dependencies with Scoop..."
    scoop install git
    scoop install sudo
    scoop install oh-my-posh
    scoop install neovim
    scoop install bat
    scoop install fzf
    scoop install procs

    do {
        $response = Read-Host -Prompt "Do you want to install VSCodium?"
        if ($response -eq 'y') {
            write-host "installing VSCodium..."
            scoop install vscodium
            write-host "VSCodium installed!"
        }
    } until ($response -eq 'n')
}

# Check if $PROFILE already exists
if (-not (test-path $profile)) {
    Write-Information -MessageData "`$PROFILE` does not exist, let me create for you..." -InformationAction Continue

    createProfile
    copyPowerShellConfigFiles

    Write-Information -Messagedata "`$PROFILE` created on $PROFILE"

    InstallDependenciesWithScoop

    Write-Host "Dependencies Installed Successfully! Please restart your Terminal"

} else {
    Write-Warning "$PROFILE already exists!"
}


