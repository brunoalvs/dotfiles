# WindowsPostInstall [in progress]

## Features

- [x] Winget
- [x] Windows Terminal
- [x] Latest PowerShell
- [x] Scoop - A command line installer
- [x] Sudo
- [x] Git for Windows
- [x] Visual Studio Code
- [ ] NeoVim
- [ ] Oh My Posh - Prompt theme engine
- [ ] NerdFonts - Powerline-patched fonts
- [ ] Terminal-Icons - File and folder icons in your terminal
- [ ] PSReadLine - Cmdlets for customizing the editing environment, used for autocompletion
- [ ] z - Directory jumper
- [ ] Fzf, PSFzf - Fuzzy finder

## Directory structure

    .$env:USERPROFILE\.config
    └── powershell
    	├── user_profile.ps1        	# Config file (like .bashrc or .zshrc on linux)
    	├── my.omp.json                 # A custom theme for Oh My Posh
    	└── scripts.psm1		# Scripts to add some 'features' to terminal


## Winget

Windows Package Manager or **winget** command-line tool enables users to
discover, install, upgrade, remove and configure aplications on Windows 10 and
Windows 11 computers.

Winget is bundled with Windows 11 and modern versions of Windows 10 by default
as the App Installer. But, if you are running an earlier version of Windows, the
winget is not installed.

You can get the App Installer from the [Microsoft Store](https://www.microsoft.com/p/app-installer/9nblggh4nns1#activetab=pivot:overviewtab).


## Windows Terminal

This will be quick, you just need go to [Microsoft Store](https://aka.ms/terminal) and install it. And if you need some support or more info check [Microsoft Docs](https://docs.microsoft.com/en-us/windows/terminal/install).

If you have Windows 11 or a modern version of Windows 10, you can use `winget` the command-line tool of Windows, so you just need to open your terminal (or prompt command in this case) and run the following command:

```bash
winget install Microsoft.WindowsTerminal
```

> Note: See the [winget documentations](https://docs.microsoft.com/en-us/windows/package-manager/winget) for a list of system requirements and installing instructions.


## PowerShell

In order to use some tools, you'll need to search and install the latest version of PowerShell, using the following command:


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

[Scoop](https://scoop.sh/) is another command-line for windows, but it's more popular than winget and it provides a larger app library. If you want you can using both.

To install you'll need open your PowerShell terminal and run:

```bash
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-WebRequest get.scoop.sh | Invoke-Expression
```

Great, now you can use Scoop.

> If you need advanced installation options, check out the [Installer's Readme](https://github.com/ScoopInstaller/Install#readme)

## Sudo

Yes, you can use `sudo` command in your Windows. You just need install using scoop:
```bash
scoop install sudo
```

## Git

You just need to run in your terminal the command `scoop install git`. After
install you can also use `git flow` in your terminal.

> If you want more information about git flow, you can check [here](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

## SSH <!-- TODO: Add instructions to generate ssh keys, and link to github docs about it -->


## Visual Studio 
<!-- TODO: Rewrite this section, actually you'll really need run `scoop bucket add extras` before try install vscode -->

Probably the most popular source code editor in these days, you can also use `scoop` to install it running the follow command:

```bash
scoop install vscode
```
> Maybe you'll also need to run `scoop bucket add extras`.

## Node


```bash
scoop install nvm
```



```bash
nvm install lts
```


```bash
nvm use lts
```


<!-- 
Using `nvm` (Node Version Manager) makes it easier to install and manage multiple versions of Node.js on a single local environment. If you only need a single version of Node.js right now, I recommend you to using nvm because it allows you to switch between different versions of Node (depending on the requirements of your project) with minimal hassle.



To install nvm, you can follow guide available on [nvm github repository](https://github.com/nvm-sh/nvm). But here, we'll install using scoop: -->

<!-- > Note: Nvm is not recommended to use in production enviroment, in this case you can use a S.O package to install a Node.js version that you need. -->

<!-- > Note: You shouldn't use NVM in production enviroment, in this case you can use a S.O package to install a Node.js version that you need. -->

## NeoVim
<!-- TODO: Add a link to neovim setup instructions -->

```bash
scoop bucket add extras
scoop install vcredist2022
```

Now you can uninstall `vcredist2022`, just run:
```bash
scoop uninstall vcredist2022
```

Now just run
```bash
scoop install neovim gcc
```

And that's it, to use you just need run in your terminal `nvim`. 

From now on, I'll use only nvim, but you can use another code editor if your rather.

> If you need advance instructions or more details, you can visit [NeoVim Installing instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## Vim Plug

In order to use my `vim dotfiles`, you'll need install `Vim-Plug` in to NeoVim.

## Config your Powershell

First of all we need to install [Oh-My-Posh](https://ohmyposh.dev), a prompt theme engine.

We'll install it using scoop:

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

<!-- TODO: Update instructions to setup user_profile.ps1 -->
<!-- TODO: Add instructions to fix and setup user_profile.ps1 -->