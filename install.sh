#!/usr/bin/sh

# Clean up previous links if exists
rm -v ~/.config/fish/config.fish
rm -v ~/.config/nvim/init.vim
rm -v ~/.tmux.conf
rm -v ~/.gitconfig
rm -v ~/.inputrc

# Create links
ln -sv ~/.dotfiles/config.fish $HOME/.config/fish/config.fish
ln -sv ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sv ~/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sv ~/.dotfiles/gitconfig ~/.gitconfig
ln -sv ~/.dotfiles/inputrc $HOME/.inputrc
