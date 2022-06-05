# WindowsPostInstall [in progress]

## Features

- [x] Windows Terminal
- [x] PowerShell 7
- [x] Scoop - A command line installer
- [x] Git for Windows
- [x] Visual Studio Code
- [] NeoVim
- [] NerdFonts - Powerline-patched fonts
- [] Oh My Posh - Prompt theme engine
- [] Terminal-Icons - File and folder icons in your terminal
- [] PSReadLine - Cmdlets for customizing the editing environment, used for autocompletion
- [] z - Directory jumper
- [] Fzf, PSFzf - Fuzzy finder

## Directory structure

    .$env:USERPROFILE\.config
    └── powershell
    	├── user_profile.ps1        	# Config file (like .bashrc or .zshrc on linux)
    	├── my.omp.json                 # A custom theme for Oh My Posh
    	└── scripts.psm1		# Scripts to add some 'features' to terminal

## Windows Terminal

This will be quick, just you need go to [Microsoft Store](https://aka.ms/terminal) and install it. And if you need some support or more info check [Microsoft Docs](https://docs.microsoft.com/en-us/windows/terminal/install);

If you have Windows 11 or a modern version of Windows 10, you can use `winget` the command-line tool of Windows, so you just need open your terminal (prompt command in this case) and run the follow command:

```bash
winget install Microsoft.WindowsTerminal
```

> Note: See the [winget documentations](https://docs.microsoft.com/en-us/windows/package-manager/winget) for a list of system requirements and install instructions.


## PowerShell 7+

We'll need to install PowerShell 7+ in order to use some tools going forward. So
let's install the latest version of PowerShell using `winget`, first search for
the latest version of PowerShell:

```Powershell
winget search Microsoft.PowerShell
```

The output must be something like these:

```bash
Name               Id                           Version Source
---------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.2.4.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.3.0.3 winget
```

Now, you can install PowerShell or PowerShell Preview using the `id` parameter.

```bash
winget install Microsoft.PowerShell
```


## Scoop

[Scoop](https://scoop.sh/) is another command-line for windows, but it's more popular than winget and this provides a larger app library. Nothing prevents you from using both.

To install you'll need open your PowerShell terminal and run:

```bash
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-WebRequest get.scoop.sh | Invoke-Expression
```

> If you need advanced installation options, check out the [Installer's Readme](https://github.com/ScoopInstaller/Install#readme)

## Git

Nowadays it is much easier to install Git on Windows than it once was, and it's even more using scoop.
You just need run in your terminal the command `scoop install git` and now enjoy.

## Visual Studio

Probably the most popular source code editor in these days, you can also use scoop to install it running the follow command:

```bash
scoop install vscode
```
> Maybe you need run `scoop bucket add extras` too.

## NeoVim

Just run
```bash
scoop install neovim gcc
```

From now on, I'll use only nvim, but you can use another code editor if your rather.

## Config your Powershell

First all we need install [Oh-My-Posh](https://ohmyposh.dev), a prompt theme engine. We'll install using scoop:
```bash
scoop install oh-my-posh
```

Now we'll make a user profile and set command aliases to our powershell. We need to create this follow directories structure `~/.config/powershell`.
Let's ensure that this structure will be created in the user root folder by running the command:

```bash
mkdir ~/.config/powershell
```

If you use nvim, run:

```bash
nvim ~/.config/powershell/user_profile.ps1
```

Case you prefer use vscode, run:
```bash
code ~/.config/powershell/user_profile.ps1
```

Edit your PowerShell profile script (`$PROFILE`):
```powershell
nvim $PROFILE
```

Then add the following line
```powershell
. $env:USERPROFILE\.config\powershell\user_profile.ps1
```

Restart your terminal, then open your `user_profile.ps1` with your editor and add the line:
```bash
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\spaceship.omp.json" | Invoke-Expression
```

Save and run in your terminal `$PROFILE` command, to reload your terminal with oh-my-posh using `spaceship` theme.
```bash
$PROFILE
```

> If you wanna see available themes to oh-my-posh, you can run `Get-PoshThemes` and see a list of themes. To change it, you just need change in your `user_profile.ps1` file. See [oh-my-posh docs](https://ohmyposh.dev/docs/installation/customize) to more info.


### Add NerdFonts and Terminal Icons
Install NerdFonts in your Windows, apply on your terminal config and install `Terminal-Icons` on your Powershell running:

```bash
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
```

Then add the folloing line in your `user_profile.ps1`:
```bash
Import-Module -Name Terminal-Icons
```

> Follow instructions in this [article](https://gist.github.com/brunoalvs/)Desde o começo dessa semana, estou