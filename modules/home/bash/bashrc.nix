''
# .bashrc

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PATH="$HOME/.local/bin:$HOME/bin:$PATH"

if [ -f $HOME/.config/starship.toml ]; then
    eval "$(starship init bash)"
fi

export PATH

# functions for ranger to cd dir after exit ranger
function rangercd {
    if [ "$TERM" = "dumb" ]; then
        echo "You cannot run ranger in this terminal."
        return 1
    fi

    tmp="$(mktemp)"
    ranger "$@" --choosedir="$tmp"
    if [ -f "$tmp" ]; then
        dir=`cat "$tmp"`
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

alias cls='clear'
alias csl='clear'
alias lcs='clear'
alias lsc='clear'
alias scl='clear'
alias slc='clear'
alias q='exit'
alias qq='exit'
alias lf='lfcd'
alias r='rangercd'
alias ls='exa'
alias ll='exa -lg'
alias cat='bat'
alias ep='export http_proxy="http://127.0.0.1:15777" && export https_proxy="http://127.0.0.1:15777"'
alias nep='unset http_proxy && unset https_proxy'

eval "$(starship init bash)"
''
