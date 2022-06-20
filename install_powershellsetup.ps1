function copyPowerShellConfigFiles () {
    Write-Message: "Moving Powershell config files..."
    Copy-Item ".\powershell" -Destination "$env:USERPROFILE\.config\powershell" -Recurse
    Write-Message: "Powershell config moved! Please, restart your terminal."
}

function createProfile () {
    Write-Information ". $env:USERPROFILE\.config\powershell\user_profile.ps1" 6> $PROFILE
}

# Check if $PROFILE already exists
if (-not (test-path $profile)) {
    Write-Warning: "$PROFILE does not exist, let me create for you..."
    
    createProfile
}
