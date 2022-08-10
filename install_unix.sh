#!/bin/sh
echo "Hi"

function prompt_install_homebrew() {
  echo "Do you want to install homebrew? (yes/no)"
  read -r answer
  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Skipping homebrew installation..."
  fi
}

function prompt_install_iterm2() {
  echo "Do you want to install iterm2? (yes/no)"
  read -r answer
  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing iterm2..."
    brew cask install iterm2
  else
    echo "Skipping iterm2 installation..."
  fi
}

prompt_install_homebrew
prompt_install_iterm2

echo "See you soon!"
