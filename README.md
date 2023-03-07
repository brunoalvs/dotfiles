> **WARNING:** This repository was created for personal use only. Use at your own risk!

# Bruno's dotfiles

These are config files to set up a system that way I like it. It's a work in progress, so it's not perfect yet.


## 1. Windows Requirements


To install the dotfiles on Windows, you need have the winget installed. Its a package manager for Windows that comes with Windows 10 
- [winget](https://docs.microsoft.com/en-us/windows/package-manager/winget/)
- [scoop](https://scoop.sh/)

### 1.1. Install winget

Winget is a package manager for Windows that comes with Windows 10. If you don't have it, try to update your Windows 10 to the latest version. If you still don't have it, you can install it manually.

```powershell
# Install winget
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://aka.ms/winget-powershell-install')
```

### 1.2. Install scoop

Scoop is a command-line installer for Windows. It is similar to Homebrew on macOS or apt on Linux. It is a command-line tool that installs and manages other command-line tools.

```powershell
iwr -useb get.scoop.sh | iex
```

If you have any problems installing scoop, you can check the [official documentation](https://scoop.sh/).

## Installation

```bash
git clone
cd dotfiles
./install.sh
```

