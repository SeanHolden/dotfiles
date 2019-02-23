mkdir -p $HOME/.config/nvim
rm -rf $HOME/.config/nvim/init.vim
ln -s $HOME/Dotfiles/vimrc $HOME/.config/nvim/init.vim
rm -rf $HOME/.ctags
ln -s $HOME/Dotfiles/ctags $HOME/.ctags
