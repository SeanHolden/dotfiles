# nvim config
mkdir -p $HOME/.config/nvim
rm -rf $HOME/.config/nvim/init.vim
ln -s $HOME/Dotfiles/vimrc $HOME/.config/nvim/init.vim

# gitconfig
ln -s $HOME/Dotfiles/gitconfig $HOME/.gitconfig
