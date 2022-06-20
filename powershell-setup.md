# PowerShell Setup

I'll consider that you already install `scoop` and using it to install `git`. Ensure that you already have them installed, before proceeding.
> Check [Windows Post-Install Instructions](WindowsPostInstall.md) to get more details.


## Prerequisites
- [Scoop](https://scoop.sh)
- [Nerd Font](https://nerdfonts.com/font-downloads)


## Directory structure

    .$env:USERPROFILE\
    └── .config/
        └── powershell
            ├── user_profile.ps1        	# Config file (like .bashrc or .zshrc on linux)
            └── scripts.psm1		        # Scripts to add some 'features' to terminal
        ...

> If you need any help with font installations, please check [Nerd Fonts ReadMe
Github](https://github.com/ryanoasis/nerd-fonts#option-1-download-and-install-manually)


## Oh-My-Posh

`Oh-My-Posh` provides theme features and capabilities for a experience with Git status color-coding and a fully customized command prompt.

You can use scoop to install oh-my-posh, using command below:
```bash
scoop install oh-my-posh
```

This will install:
    - `oh-my-posh.exe`: Windows executable
    - `themes`: The latest [Oh My Posh themes](https://ohmyposh.dev/docs/themes)

