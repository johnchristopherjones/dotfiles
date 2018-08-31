# Add local (homebrew) bins
PATH=/usr/local/sbin:${PATH}
PATH=/usr/local/bin:${PATH}

# Add yarn path
PATH=$(yarn global bin):$(yarn bin):${PATH}

# Add Visual Studio Code ("code")
PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"

# Add personal binaries
PATH=~/.dotfiles/bin:${PATH}