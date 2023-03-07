# 1. Install Scoop
# https://scoop.sh/
function InstallScoop () {
    $scoopUrl = "https://get.scoop.sh"
    $scoopPath = "$env:USERPROFILE\scoop\shims\scoop.ps1"
    $scoopShimPath = "$env:USERPROFILE\scoop\shims\scoop"

    if (Test-Path $scoopPath) {
        Write-Host "Scoop is already installed."
        return
    } else {
        Write-Host "Scoop is not installed."
        
        do {
            $response = Read-Host -Prompt "Do you want to install Scoop?"
            if ($response -eq 'y') {
                Write-Host "Installing Scoop..."
                Invoke-Expression (New-Object System.Net.WebClient).DownloadString($scoopUrl)
                Write-Host "Scoop is installed."
            }
        } until ($response -eq 'n')
    }
}

# 2. Install dependencies with scoop
function InstallDependenciesWithScoop () {
    scoop install git
    scoop install sudo
    scoop install oh-my-posh
    scoop install neovim
    scoop install bat
    scoop install fzf
    scoop install procs
}

# 3. Create new profile file
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.1
function CreateNewProfileFile () {
    if (-not (Test-Path $PROFILE))
    {
        Write-Host "Creating new profile file..."
    } else {
        Write-Host "Profile file already exists."
    }
}

# 4. Install Modules with PowerShellGet
# https://docs.microsoft.com/en-us/powershell/scripting/gallery/how-to/working-with-the-gallery?view=powershell-7.1

function InstallModulesWithPowerShellGet () {
    White-Host "Installing modules with PowerShellGet..."
    # Install-Module -Name Terminal-Icons
    # Install-Module -Name PSFzf
    # Install-Module -Name PSReadLine
}

# 5. Start to run the script
function Install () {
    # 1. Install Scoop
    InstallScoop
    # 2. If scoop is installed, install dependencies with scoop
    if (Test-Path $scoopPath) {
        InstallDependenciesWithScoop
    }
    # 3. Create new profile file
    CreateNewProfileFile

    # 4. Install Modules with PowerShellGet
    InstallModulesWithPowerShellGet

    # 5. Copy PowerShell config files
    Copy-Item ".\powershell" -Destination "$env:USERPROFILE\.config\powershell" -Recurse

    # 6. Write to $PROFILE the new profile file path
    if (-not (Test-Path $env:USERPROFILE\.config\powershell\user_profile.ps1))
    {
        Write-Host "Creating new profile file..."
        Write-Information ". $env:UserPROFILE\.config\powershell\user_profile.ps1" 6> $PROFILE
    } else {
        Write-Host "Profile file already exists."
    }
    
    # 7. Restart PowerShell
    Write-Host "Please, restart your terminal."
}

# 6. Run the script
try {
    Install
} catch {
    Write-Error $_
}