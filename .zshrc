# Initializations
eval "$(mise activate zsh)"
eval "$(starship init zsh)"


# PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.lmstudio/bin"

# Aliases
alias python='python3'
alias ls='eza'
alias brain='cd ~/Documents/Vaults/GooseBrain'
alias claims='cd ~/Documents/Vaults/GooseBrain/vault/Central\ Library/Claims'
alias vf='vim "$(fzf)"'
alias fclaim='fzf --walker-root ~/Documents/Vaults/GooseBrain/vault/Central\ Library/Claims --delimiter / --with-nth -1 -i'

# Functions
bsesh() {
    tmux new-window
    tmux send-keys 'brain && clear' Enter
    tmux split-window -h
    tmux send-keys 'brain && claude' Enter
}

wlinks() {
    grep -o '\[\[[^]]*\]\]' "$1" | sed 's/\[\[//g;s/\]\]//g'
}

# rg + fzf live grep
if command -v rg &> /dev/null && command -v fzf &> /dev/null; then
    frg() {
        local preview_cmd
        if command -v bat &> /dev/null; then
            preview_cmd='bat --color=always {1} --highlight-line {2}'
        else
            preview_cmd='cat {1}'
        fi
        fzf --disabled --ansi \
            --bind "start:reload:rg --line-number --color=always {q} || true" \
            --bind "change:reload:rg --line-number --color=always {q} || true" \
            --delimiter : \
            --preview "$preview_cmd" \
            --preview-window 'right:60%:+{2}+3/3'
    }
fi

# fzf
if command -v fzf &> /dev/null; then
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
    if command -v bat &> /dev/null; then
        export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}'"
    fi

    # Brew-installed fzf shell integration
    if [ -f "$(brew --prefix 2>/dev/null)/share/fzf/shell/key-bindings.zsh" ]; then
        source "$(brew --prefix)/share/fzf/shell/key-bindings.zsh"
        source "$(brew --prefix)/share/fzf/shell/completion.zsh"
    # Git-installed fzf shell integration (non-Mac fallback)
    elif [ -f "$HOME/.fzf.zsh" ]; then
        source "$HOME/.fzf.zsh"
    fi
fi
