# Setup NeoVim

## Features

- [x] Requirements

## Directory Structure

    .$env:USERPROFILE\
    └── AppData/Local/nvim
    	├── init.vim

## Requirements

Python and Node


## Arquivos de Configuração

### VIM

### Neovim

Vamos usar o `init.vim`.


## Vim Plug

Run in terminal to install in Neovim
```bash
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

> If you need more details or advance info, check the oficial documentation on [github](https://github.com/junegunn/vim-plug)

## FINISH HIM

With Vim Plug installed, you just need to install plugins that you want and you can install it with the following command:
```vim
:PlugInstall
```