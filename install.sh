# nvim config
mkdir -p $HOME/.config/nvim
rm -rf $HOME/.config/nvim/init.vim
ln -s $HOME/Dotfiles/vimrc $HOME/.config/nvim/init.vim

# ctags
rm -rf $HOME/.ctags
ln -s $HOME/Dotfiles/ctags $HOME/.ctags

# bash_it custom theme
mkdir -p $HOME/.bash_it/themes/sholden
rm -rf $HOME/.bash_it/themes/sholden/sholden.theme.bash
ln -s $HOME/Dotfiles/sholden.theme.bash $HOME/.bash_it/themes/sholden/sholden.theme.bash

# kitty
mkdir -p $HOME/.config/kitty
rm -rf $HOME/.config/kitty/kitty.conf
ln -s $HOME/Dotfiles/kitty.conf $HOME/.config/kitty/kitty.conf
