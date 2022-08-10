#!
echo "Hi"

function prompt_install_homebrew() {
  echo "Do you want to install homebrew? (yes/no)"
  read -r answer
  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "homebrew installed"
  else
    echo "Skipping homebrew installation..."
  fi
}

function prompt_install_iterm2() {
  echo "Do you want to install iTerm2? (yes/no)"
  read -r answer
  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing iTerm2..."
    brew install --cask iterm2
    echo "iTerm2 installed!"
  else
    echo "Skipping iTerm2 installation..."
  fi
}

function prompt_install_nvm() {
  echo "Do you want to install Node Version Manager (nvm)? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    echo "NVM installed!"
  else
    echo "Skipping..."
  fi
}

function prompt_install_vscodium() {
  echo "Do you want to install vscodium? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing vscodium..."
    brew install --cask vscodium
    echo "VSCodium installed!"
  else
    echo "Skipping..."
  fi
}

function prompt_install_vscode() {
  echo "Do you want to install vscode? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing vscode..."
    brew install --cask visual-studio-code
    echo "Visual Studio Code installed!"
  else
    echo "Skipping..."
  fi
}

function prompt_install_insomnia() {
  echo "Do you want to install Insomnia? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing Insomnia..."
    brew install --cask insomnia
    echo "Insomnia installed!"
  else
    echo "Skipping..."
  fi
}

function prompt_install_chrome() {
  echo "Do you want to install Chrome? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing Chrome..."
    brew install --cask google-chrome
    echo "Chrome installed!"
  else
    echo "Skipping..."
  fi
}

function prompt_install_chromium() {
  echo "Do you want to install Chromium? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing Chromium..."
    brew install --cask chromium
    echo "Chromium installed!"
  else
    echo "Skipping..."
  fi
}

function prompt_install_neovim() {
  echo "Do you want to install neovim? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing neovim..."
    brew install neovim
    echo "Neovim installed!"
  else
    echo "Skipping..."
  fi
}

function prompt_install_terminal_apps() {
  echo "Do you want to install terminal apps? (yes/no)"
  read -r answer

  if [[ $answer =~ ^(yes|y|sim)$ ]]; then
    echo "Installing terminal apps..."
    brew install bat
    echo "Terminal apps installed!"
  else
    echo "Skipping..."
  fi
}

prompt_install_homebrew
prompt_install_nvm
prompt_install_vscodium
prompt_install_vscode
prompt_install_insomnia
prompt_install_chrome
prompt_install_chromium
prompt_install_neovim

if [[ $(uname) == "Darwin" ]]; then
  echo "Running on mac"
  # install homebrew
  prompt_install_iterm2
else
  echo "Running on linux"
fi

echo "See you soon!"


# install_apps_with_homebrew() {
#   # Install apps with Homebrew
#   # Show percentage of progress in the terminal
#   echo "Installing apps with Homebrew..."
#   brew install git
#   brew install neovim
#   brew install bat
#   brew install zsh

#   brew install --cask insomnia
#   brew install --cask chromium
#   brew install --cask visual-studio-code

#   # Install apps with Homebrew Cask
#   # Show percentage of progress in the terminal
#   echo "Installing apps with Homebrew Cask..."
#   brew cask install iterm2
#   brew cask install google-chrome
#   brew cask install firefox
#   brew cask install visual-studio-code
#   echo "Installing apps with Homebrew Cask... Done!"
# }
