# 1. Check if powershell is installed with the latest version
function handlePowerShell () {
    # Check if powershell is installed with the latest version using winget
    $powershellVersion = winget show Microsoft.PowerShell | Select-String -Pattern "Version" | Select-Object -Last 1 | Select-Object -ExpandProperty Line
    $powershellVersion = $powershellVersion.Split(":")[1].Trim()
    $powershellVersion = $powershellVersion.Split(".")[0..1] -join "."
    $powershellVersion = [version]$powershellVersion

    $latestPowershellVersion = winget show Microsoft.PowerShell --versions | Select-String -Pattern "Version" | Select-Object -Last 1 | Select-Object -ExpandProperty Line
    $latestPowershellVersion = $latestPowershellVersion.Split(":")[1].Trim()
    $latestPowershellVersion = $latestPowershellVersion.Split(".")[0..1] -join "."
    $latestPowershellVersion = [version]$latestPowershellVersion


    if ($powershellVersion -eq $latestPowershellVersion) {
        Write-Host "Powershell is installed with the latest version."
    } else {
        Write-Host "Powershell is not installed with the latest version."
        do {
            $response = Read-Host -Prompt "Do you want to install the latest version of Powershell?"
            if ($response -eq 'y') {
                Write-Host "Installing the latest version of Powershell..."
                winget install Microsoft.PowerShell
                Write-Host "Powershell is installed with the latest version."
            }
        } until ($response -eq 'n')
    }
}

function InstallWindowsTerminal () {

    Write-Host "Installing Windows Terminal..."
    winget install Microsoft.WindowsTerminal
    Write-Host "Windows Terminal is installed."
}

# 2. Install Scoop
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

# 3. Install dependencies with scoop
function InstallDependenciesWithScoop () {
    scoop install git
    scoop install sudo
    scoop install oh-my-posh
    scoop install neovim
    scoop install bat
    scoop install fzf
    scoop install procs
}

# 4. Create new profile file
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.1
function CreateNewProfileFile () {
    if (-not (Test-Path $PROFILE))
    {
        Write-Host "Creating new profile file..."
    } else {
        Write-Host "Profile file already exists."
    }
}

# 5. Install Modules with PowerShellGet
# https://docs.microsoft.com/en-us/powershell/scripting/gallery/how-to/working-with-the-gallery?view=powershell-7.1

function InstallModulesWithPowerShellGet () {
    White-Host "Installing modules with PowerShellGet..."
    Install-Module -Name Terminal-Icons
    Install-Module -Name PSFzf
    # Install-Module -Name PSReadLine
}

# 6. Start to run the script
function Install () {

    handlePowerShell
    InstallWindowsTerminal
    InstallScoop

    InstallDependenciesWithScoop
    CreateNewProfileFile
    InstallModulesWithPowerShellGet

    Copy-Item ".\powershell" -Destination "$env:USERPROFILE\.config\powershell" -Recurse

    if (-not (Test-Path $env:USERPROFILE\.config\powershell\user_profile.ps1))
    {
        Write-Host "Creating new profile file..."
        Write-Information ". $env:UserPROFILE\.config\powershell\user_profile.ps1" 6> $PROFILE
    } else {
        Write-Host "Profile file already exists."
    }
    
    Write-Host "Please, restart your terminal."
}

try {
    Install
} catch {
    Write-Error $_
}