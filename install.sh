# Move files from here to Dotfiles in home
mkdir -p "$HOME"/Dotfiles
cp vimrc "$HOME"/Dotfiles/vimrc
cp gitconfig "$HOME"/Dotfiles/gitconfig

# nvim config
mkdir -p "$HOME"/.config/nvim
rm -rf "$HOME"/.config/nvim/init.vim
ln -s "$HOME"/Dotfiles/vimrc "$HOME"/.config/nvim/init.vim

# gitconfig
ln -s "$HOME"/Dotfiles/gitconfig "$HOME"/.gitconfig

