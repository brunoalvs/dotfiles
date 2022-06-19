# PowerShell Setup

I'll consider that you already install `scoop` and using it to install `git`. Ensure that you already have them installed, before proceeding.

> Check [Windows Post-Install Instructions](WindowsPostInstall.md) to get more details. 

## Directory structure

    .$env:USERPROFILE\
    └── .config/
        └── powershell
            ├── user_profile.ps1        	# Config file (like .bashrc or .zshrc on linux)
            └── scripts.psm1		        # Scripts to add some 'features' to terminal
        ...

## Requirements
- Scoop
- Git

## Oh-My-Posh

`Oh-My-Posh` provides theme features and capabilities for a experience with Git status color-coding and a fully customized command prompt.

Use scoop to install oh-my-posh, using command below:
```bash
scoop install oh-my-posh
```

Now, use