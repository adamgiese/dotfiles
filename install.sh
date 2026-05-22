if ! command -v mise &> /dev/null; then
    curl https://mise.run | sh
fi

ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.mise.toml ~/.mise.toml
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

mkdir -p ~/.config/ghostty
ln -sf ~/.dotfiles/ghostty ~/.config/ghostty/config

mkdir -p ~/.config
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml

mise install
mise trust ~/.mise.toml

