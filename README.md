## Install

```bash
sh install.sh
```

## Requirements
For neovim

* neovim
* Python 3 for deoplete
* pynvim (neovim python client) for deoplete https://github.com/neovim/pynvim
* tern (install globally) for JS autocomplete https://www.npmjs.com/package/tern
* vim-plug (neovim) to run :PlugInstall https://github.com/junegunn/vim-plug
* Once all the above is installed, open neovim and run :PlugInstall

## Notes
can check if python is installed with neovim by running: `:echo has("python")`.
1 is true, 0 is false.

ctags taken from https://github.com/romainl/ctags-patterns-for-javascript
