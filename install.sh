#!/usr/bin/env sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Install Oh-My-Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Create neovim config directory"
    mkdir -p $HOME/.config/nvim
fi

# Clean up previous links if exists
# rm -v ~/.config/fish/config.fish
# rm -v ~/.config/fish/functions/fish_mode_prompt.fish
rm -v ~/.zshrc
rm -v ~/.config/nvim/init.vim
rm -v ~/.tmux.conf
rm -v ~/.gitconfig
rm -v ~/.inputrc

# Create links
# if [ ! -d "$HOME/.config/fish/functions" ]; then
#     mkdir -v -p "$HOME/.config/fish/functions"
# fi
# ln -sv ~/.dotfiles/config.fish $HOME/.config/fish/config.fish
# ln -sv ~/.dotfiles/fish_mode_prompt.fish $HOME/.config/fish/functions/fish_mode_prompt.fish
ln -sv $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -sv $HOME/.dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -sv $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sv $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -sv $HOME/.dotfiles/inputrc $HOME/.inputrc

# Additional zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source $HOME/.zshrc
