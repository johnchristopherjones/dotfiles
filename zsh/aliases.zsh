# Use colors in coreutils utilities output
if command -v gls > /dev/null 2>&1; then
    alias ls='gls --color -N'
    alias dircolors='gdircolors'
elif ls --color -d . &>/dev/null 2>&1; then
    alias ls='ls --color -N'
else
    alias ls='ls -G'
fi
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias lla='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# git related aliases
alias gag='git exec ag'

# Update dotfiles
function dfu() {
    (
        cd ~/.dotfiles && git pullff && ./install -q
    )
}

# Use pip without requiring virtualenv
function syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
function mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
function jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
function scr_cd()
{
    builtin cd $1
    screen -X chdir $PWD
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
function up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for i in {1..${1}}; do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
function in() {
    (
        cd ${1} && shift && ${@}
    )
}

# Check if a file contains non-ascii characters
function nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' ${1}
}

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'

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

# Fix screen sharing by unload and reloading the serice
# Note that as of OS X 10.11 this is a legacy command; try kickstart?
alias fixscreen='sudo launchctl unload /System/Library/LaunchDaemons/com.apple.screensharing.plist && sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist'
