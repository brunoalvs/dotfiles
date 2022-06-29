install_homebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_apps_with_homebrew() {
    brew install git
    brew install neovim
    brew install bat
    
}