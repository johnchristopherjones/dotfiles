
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
brew install diff-so-fancy
brew install ssh-copy-id
brew install the_platinum_searcher # command `pt` rapidly searches code
brew install tree
brew install wget

# Install development environment brews
# brew install macvim --env-std --with-lua --custom-icons --override-system-vim --HEAD
brew install emojify
brew install hub
brew install node
brew install pandoc
brew install python3
brew install ruby

# Install databases (development)
brew install mongodb
brew install postgres
brew install redis

# Install pip packages
sudo -H pip3 install --isolated powerline-status
sudo -H pip3 install --isolated powerline-gitstatus

# Install node packages
# npm install -g coffee-script

# Install brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew install caskroom/cask/brew-cask

# Install essential casks
# brew cask install flux
# brew cask install hazel
brew cask install 1password
brew cask install atom
brew cask install dropbox
brew cask install evernote
brew cask install google-chrome
brew cask install keyboard-maestro
brew cask install omnigraffle
brew cask install omnioutliner
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install things

# Install work casks
brew cask install kaleidoscope
# brew cask install microsoft-office

# Install home casks
# brew cask install battle-net
# brew cask install discord
# brew cask install gog-galaxy
# brew cask install handbreak
# brew cask install java
# brew cask install mactex
# brew cask install mplayerx
# brew cask install silverlight
# brew cask install skype
# brew cask install steam
# brew cask install vlc
# brew cask install ynab
## brew cask install the-unarchiver
## brew cask install torbrowser
## brew cask install trim-enabler
## brew cask install utorrent

# Tap brew services
brew tap homebrew/services

# Tap alternate versions
brew tap caskroom/versions
# brew cask install sublime-text3

# Remove outdated versions from the Cellar
brew cleanup

# Link .app files into /Applications
brew linkapps

# Install atom packages
apm stars --install  # Install atom packages
