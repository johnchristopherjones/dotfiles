# Initialize completion
autoload -Uz compinit && compinit

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Set automatic cd (typing directory name with no 'cd')
setopt autocd

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # corresponds to 10ms

# Use vim as the editor
export EDITOR=atom

# Use less as the pager
export PAGER=less

# Use emacs style line editing in zsh
bindkey -e
# Edit line
bindkey '^W' vi-backward-kill-word
# Set word characters (included in backward-kill-word)
export WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# # Use emacs style line editing in zsh
# bindkey -v
# # Movement
# bindkey -a 'gg' beginning-of-buffer-or-history
# bindkey -a 'G' end-of-buffer-or-history
# # Undo
# bindkey -a 'u' undo
# bindkey -a '^R' redo
# # Edit line
# bindkey -a '^V' edit-command-line
# # Backspace
# bindkey '^?' backward-delete-char
# bindkey '^H' backward-delete-char

# Use incremental search
bindkey "^R" history-incremental-search-backward
