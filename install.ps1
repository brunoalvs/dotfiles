# 1. Check if powershell is installed with the latest version
function handlePowerShell () {
    # Prompt user to install Microsoft PowerShell if it is not installed
    if (-not (Get-Command pwsh -ErrorAction SilentlyContinue)) {
        Write-Host "Microsoft PowerShell is not installed."
        do {
            $response = Read-Host -Prompt "Do you want to install Microsoft PowerShell?"
            if ($response -eq 'y') {
                Write-Host "Installing Microsoft PowerShell..."
                winget install Microsoft.PowerShell
                Write-Host "Microsoft PowerShell is installed."
            }
        } until ($response -eq 'n')
    } else {
        Write-Host "Microsoft PowerShell is installed. Moving on..."
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
        Write-Information "Scoop is already installed."
        return
    } else {
        Write-Information "Scoop is not installed."
        
        do {
            $response = Read-Host -Prompt "Do you want to install Scoop?"
            if ($response -eq 'y') {
                Write-Information "Installing Scoop..."
                Invoke-Expression (New-Object System.Net.WebClient).DownloadString($scoopUrl)
                Write-Information "Scoop is installed."
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
# function CreateNewProfileFile () {
#     if (-not (Test-Path $PROFILE))
#     {
#         Write-Information "Creating new profile file..."
#         Write-Information ". $env:UserPROFILE\.config\powershell\user_profile.ps1" 6> $PROFILE
#     } else {
#         Write-Information "Profile file already exists."
#     }
# }

# 5. Install Modules with PowerShellGet
# https://docs.microsoft.com/en-us/powershell/scripting/gallery/how-to/working-with-the-gallery?view=powershell-7.1

function InstallModulesWithPowerShellGet () {
    White-Information "Installing modules with PowerShellGet..."
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
    # CreateNewProfileFile

    Copy-Item ".\powershell" -Destination "$env:USERPROFILE\.config\powershell" -Recurse

    if (-not (Test-Path $env:USERPROFILE\.config\powershell\user_profile.ps1))
    {
        Write-Information "Creating new profile file..."
        Write-Information ". $env:UserPROFILE\.config\powershell\user_profile.ps1" 6> $PROFILE
    } else {
        Write-Information "Profile file already exists."
    }
    
    InstallModulesWithPowerShellGet
    Write-Information "Please, restart your terminal."
}

try {
    Install
} catch {
    Write-Error $_
}