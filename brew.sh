#!/bin/sh

# Derived from https://github.com/daviesjamie/dotfiles

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Use latest package definitions
brew update

# Upgrade old packages (if any)
brew upgrade

# Install essential homebrews
brew install coreutils
brew install hub
brew install macvim --env-std --with-lua --custom-icons --override-system-vim --HEAD
brew install node
brew install pandoc
brew install python
brew install ruby
brew install ssh-copy-id
brew install the_silver_searcher
brew install tree
brew install wget

# Install brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew install caskroom/cask/brew-cask

# Install cask
brew cask install 1password
brew cask install atom
apm stars --install
brew cask install dropbox
brew cask install evernote
brew cask install flux
brew cask install google-chrome
# brew cask install hazel
brew cask install keyboard-maestro
# brew cask install kaleidoscope
# brew cask install microsoft-office
brew cask install mplayerx
brew cask install skype
brew cask install spotify
brew cask install steam
## brew cask install the-unarchiver
## brew cask install torbrowser
## brew cask install trim-enabler
## brew cask install utorrent
brew cask install vlc
# brew cask install mactex

# Tap fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-source-code-pro-for-powerline

# Tap alternate versions
brew tap caskroom/versions
brew cask install sublime-text3

# Remove outdated versions from the Cellar
brew cleanup

# Link .app files into /Applications
brew linkapps
