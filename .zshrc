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
alias vf='vim "$(fzf)"'

# Functions
bsesh() {
    tmux new-window
    tmux send-keys 'brain && clear' Enter
    tmux split-window -h
    tmux send-keys 'brain && claude' Enter
}

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
