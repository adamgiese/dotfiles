if ! command -v mise &> /dev/null; then
    curl https://mise.run | sh
fi

ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.mise.toml ~/.mise.toml
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

mkdir -p ~/.vim/undo
mkdir -p ~/.claude/skills
ln -sf ~/.dotfiles/claude/skills/todo ~/.claude/skills/todo

mkdir -p ~/.config/ghostty
ln -sf ~/.dotfiles/ghostty ~/.config/ghostty/config

mkdir -p ~/.config
ln -sf ~/.dotfiles/.starship.toml ~/.config/starship.toml

mise trust ~/.mise.toml
mise install

