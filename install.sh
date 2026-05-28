if ! command -v mise &> /dev/null; then
    curl https://mise.run | sh
fi

ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.mise.toml ~/.mise.toml
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

mkdir -p ~/.vim/undo
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/todo ~/.claude/skills/query-json
ln -s ~/.dotfiles/claude/skills/todo ~/.claude/skills/todo
ln -s ~/.dotfiles/claude/skills/query-json ~/.claude/skills/query-json

mkdir -p ~/.config/ghostty
ln -sf ~/.dotfiles/ghostty ~/.config/ghostty/config

mkdir -p ~/.config
ln -sf ~/.dotfiles/.starship.toml ~/.config/starship.toml

mkdir -p ~/.config/glow
ln -sf ~/.dotfiles/glow.yml ~/.config/glow/glow.yml

if command -v brew &> /dev/null; then
    brew install --cask font-jetbrains-mono-nerd-font
    brew install fx jq newsboat fzf ripgrep glow
else
    # Non-brew fallback: fzf git installer
    if [ ! -d "$HOME/.fzf" ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --key-bindings --completion --no-update-rc
    fi
fi

mkdir -p ~/.newsboat
ln -sf ~/.dotfiles/newsboat/config ~/.newsboat/config
touch ~/.newsboat/urls
newsboat --import-from-opml ~/.dotfiles/feeds.opml

vim +PlugInstall +qall

mise trust ~/.mise.toml
mise install

