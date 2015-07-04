#
# ~/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !
#

# Default editor
if [[ -z "$EDITOR" ]]; then
    export EDITOR="/usr/local/bin/atom --wait"
fi

# Path - Python
PATH=${PATH}:$HOME/Library/Python/2.7/bin
# Path - Google Storage
PATH=${PATH}:$HOME/gsutil
# Path - Homebrew etc
PATH=/usr/local/bin:${PATH}
# Path - Dotfiles
PATH=$HOME/.dotfiles_local/bin:$HOME/.dotfiles/bin:${PATH}
export PATH

# Python
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH

################################################################################
################################################################################
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
[[ $- != *i* ]] && return
################################################################################
################################################################################

#
# Interactive shell options
#
# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# Tab completion
#
# Git tab completion
source ~/.gitfiles/git-completion.sh

# Git-flow tab completion
source ~/.gitfiles/git-flow-completion.bash

# Homebrew tab completion
source `/usr/local/bin/brew --prefix`/Library/Contributions/brew_bash_completion.sh

#
# Liquidprompt for bash
#
source ~/.dotfiles/liquidprompt/liquidprompt

#
# LS COLORS
#
#  color       normal  bold
#  ----------  ------  ------
#  black       a       A
#  red         b       B
#  green       c       C
#  brown       d       D
#  blue        e       E
#  magenta     f       F
#  cyan        g       G
#  light grey  h       H
#  default     x

DIR=Gx
SYM_LINK=Gx
SOCKET=Fx
PIPE=dx
EXE=Cx
BLOCK_SP=Dx
CHAR_SP=Dx
EXE_SUID=hb
EXE_GUID=ad
DIR_STICKY=Gx
DIR_WO_STICKY=Gx

## Defined-above LS colors
export LSCOLORS="$DIR$SYM_LINK$SOCKET$PIPE$EXE\
$BLOCK_SP$CHAR_SP$EXE_SUID$EXE_GUID\
$DIR_STICKY$DIR_WO_STICKY"
## Michael's LS colors
#export LSCOLORS=ExFxCxDxBxegedabagacad

##
## Good old LS aliases
##
export CLICOLOR="yes"
export LS_OPTIONS='-F'
alias ls='ls $LS_OPTIONS'
alias l='ls -CF'
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

## Faster parent navigation
alias ..='cd ..'
alias ...='cd .. ; cd ..'

################################################################################
## SSHFS remote filesystem mounts
################################################################################
#alias mntHEPEX="sshfs -o allow_other,workaround=all jcj7h@hepex.phys.virginia.edu: ~/mnt/hepex_drive/"
#alias mntCMSRAID="sshfs  -o allow_other,workaround=all jcj7h@hepex.phys.virginia.edu:/raids/rnas ~/mnt/cms_raid"
#alias mntVPT="sshfs  -o allow_other,workaround=all vpt@hepex.phys.virginia.edu: ~/mnt/vpt_drive/"
#alias mntALL="mntHEPEX | mntCMSRAID | mntVPT"


################################################################################
## Directory bookmarks
################################################################################
# Usage:
# cd <bookmark>     -- go to bookmark location
# show              -- show all bookmarks
# save <bookmark>   -- save current working directory as bookmark
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ;
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .dirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

################################################################################
## Finder label color
#  From: http://superuser.com/questions/168927/mac-os-x-how-to-change-the-color-label-of-files-from-the-terminal
################################################################################
label(){
  if [ $# -lt 2 ]; then
    echo "USAGE: label [0-7] file1 [file2] ..."
    echo "Sets the Finder label (color) for files"
    echo "Default colors:"
    echo " 0  No color"
    echo " 1  Orange"
    echo " 2  Red"
    echo " 3  Yellow"
    echo " 4  Blue"
    echo " 5  Purple"
    echo " 6  Green"
    echo " 7  Gray"
  else
    osascript - "$@" << EOF
    on run argv
        set labelIndex to (item 1 of argv as number)
        repeat with i from 2 to (count of argv)
          tell application "Finder"
              set theFile to POSIX file (item i of argv) as alias
              set label index of theFile to labelIndex
          end tell
        end repeat
    end run
EOF
  fi
}

################################################################################
### Other useful stuff
################################################################################

# Case insensitive grep
alias g='grep -i'

# Easy find
alias f='find . -iname'

# List the size of all folders and files
alias ducks='du -cks * | sort -rn|head -11'

# Launch top without having to use 'man'
alias top='top -o cpu'

# Convenience alias for system log
alias systail='tail -f /var/log/system.log'

# Show what commands you use the most
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Show a graphical representation of the current sub directories
alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# Install git ignore files
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}


### oga2flac alias
### Why?  (Why not flac -8f *.oga)?  Because of Max.  That's why.
### Part of the purpose (sigh) is to trash metadata because metaflac can't read it.
### Hence, "flac -8f *.oga" will fail, because it preserves tagging.
#alias oga2flac="flac -d *.oga && flac --best *.wav && rm *.wav *.oga && ls"

################################################################################
## External imports
################################################################################
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

################################################################################
## Anything after this was appended by installers
################################################################################
