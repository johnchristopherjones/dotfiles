# External plugins (initialized after)

# dircolors
if command -v dircolors > /dev/null 2>&1; then
    if [[ "$(tput colors)" == "256" ]]; then
        eval $(dircolors =(cat ~/.zsh/plugins/dircolors-solarized/dircolors.256dark ~/.zsh/dircolors.extra))
    fi
    eval "$(dircolors -b)"
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
    export CLICOLOR=1
    zstyle ':completion:*:default' list-colors ''
    zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
fi
