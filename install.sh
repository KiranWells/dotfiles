# install the included config files
# into the correct locations

# home dotfiles
cp .zshrc ~
cp .p10k.zsh ~
cp .vimrc ~

# nvim
mkdir -p ~/.config/nvim/lua
cp init.vim ~/.config/nvim/
cp lua/plugins.lua ~/.config/nvim/lua/

# leftwm
mkdir -p ~/.config/leftwm/
cp leftwm.toml ~/.config/leftwm/
