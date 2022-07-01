abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

install_homebrew() {
  echo "Checking Homebrew..."
  if [[ $(command -v brew) == "" ]]; then
    echo "Homebrew is not installed. Would you like to install it? (y/n)"
    read answer
    if [[ $answer == "y" ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo "Homebrew is installed. Continuing..."
    else
      echo "Skipping..."
    fi
  else
    echo "Homebrew is already installed. Skipping..."
  fi
}

install_iterm2 () {
  if [[ $(uname) == "Darwin" ]]; then
    echo "Checking iTerm2..."
    if [[ $(command -v iterm2) == "" ]]; then
      echo "iTerm2 is not installed. Would you like to install it? (y/n)"
      read answer
      if [[ $answer == "y" ]]; then
        brew install --cask iterm2
      else
        echo "Skipping..."
      fi
    else
      echo "iTerm2 is already installed. Skipping..."
    fi
  fi
}

install_nvm() {
  echo "Checking nvm..."
  if [[ $(command -v nvm) == "" ]]; then
    echo "nvm is not installed. Would you like to install it? (y/n)"
    read answer
    if [[ $answer == "y" ]]; then
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    else
      echo "Skipping..."
    fi
  else
    echo "nvm is already installed. Skipping..."
  fi
}

install_apps_with_homebrew() {
  # Install apps with Homebrew
  # Show percentage of progress in the terminal
  echo "Installing apps with Homebrew..."
  brew install git
  brew install neovim
  brew install bat
  brew install zsh

  brew install --cask insomnia
  brew install --cask chromium
  brew install --cask visual-studio-code

  # Install apps with Homebrew Cask
  # Show percentage of progress in the terminal
  echo "Installing apps with Homebrew Cask..."
  brew cask install iterm2
  brew cask install google-chrome
  brew cask install firefox
  brew cask install visual-studio-code
  brew cask install sublime-text
  brew cask install postman
  brew cask install docker
  brew cask install docker-compose
  brew cask install insomnia

  echo "Installing apps with Homebrew Cask... Done!"
}