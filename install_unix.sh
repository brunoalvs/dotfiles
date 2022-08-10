#!
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

# prompt_install_iterm2

# check if its running on mac
if [[ $(uname) == "Darwin" ]]; then
  echo "Running on mac"
  # install homebrew
  if ! command -v brew >/dev/null; then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Homebrew already installed"
  fi
  # install iterm2
  if ! command -v iterm2 >/dev/null; then
    echo "Installing iterm2..."
    brew cask install iterm2
  else
    echo "iterm2 already installed"
  fi
else
  echo "Not running on mac"
fi


echo "See you soon!"


# abort() {
#   printf "%s\n" "$@" >&2
#   exit 1
# }



# install_nvm() {
#   echo "Checking nvm..."
#   if [[ $(command -v nvm) == "" ]]; then
#     echo "nvm is not installed. Would you like to install it? (y/n)"
#     read answer
#     if [[ $answer == "y" ]]; then
#       curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
#     else
#       echo "Skipping..."
#     fi
#   else
#     echo "nvm is already installed. Skipping..."
#   fi
# }

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
