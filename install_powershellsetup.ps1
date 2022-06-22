function copyPowerShellConfigFiles () {
    Write-Information "Moving Powershell config files..."
    Copy-Item ".\powershell" -Destination "$env:USERPROFILE\.config\powershell" -Recurse
    Write-Information "Powershell config moved! Please, restart your terminal."
}

function createProfile () {
    Write-Information ". $env:USERPROFILE\.config\powershell\user_profile.ps1" 6> $PROFILE
}

# Check if $PROFILE already exists
if (-not (test-path $profile)) {
    Write-Information -MessageData "$PROFILE does not exist, let me create for you..." -InformationAction Continue

    createProfile
} else {
    Write-Warning "$PROFILE already exists!"
}
