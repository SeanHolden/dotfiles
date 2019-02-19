"------------------------------------------------------------
" Features
"
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" required for Vundle. Turned back on below.
filetype off

"------------------------------------------------------------
" Plug
" - install junegunn/vim-plug (different install for neovim vs vim)
" - use with :PlugInstall
"
call plug#begin('~/.vim/plugged')
  " ctrlp and ag both used together for super fast file searching
  Plug 'kien/ctrlp.vim'
  Plug 'rking/ag.vim'
  " ctrl + n to toggle file tree
  Plug 'scrooloose/nerdtree'
  " highlight whitespace
  Plug 'ntpeters/vim-better-whitespace'
  " comment blocks out with <leader> c i
  Plug 'scrooloose/nerdcommenter'
  " beautify JS, JSON etc files with ctrl c followed by ctrl f
  " (useful for unminifying files to read them)
  Plug 'maksimr/vim-jsbeautify'
  " Prettify JS files according to rules in a .prettier config file.
  " (if updating make sure to run npm install in .vim/bundle/prettier/vim-prettier)
  " Run it with: <Leader>p
  Plug 'prettier/vim-prettier'
  " React JSX syntax highlighting and indenting
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  " just syntax highlighting plugins below this line...
  Plug 'leafgarland/typescript-vim'
  " Typescript completion and compile errors
  Plug 'Quramy/tsuquyomi'
  " Colorschemes below this line...
  Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Enable syntax highlighting
syntax on

" commandline tab completion.
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (underline words searched for)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position in bottom right (e.g. 44,58)
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
" set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Auto refresh file when changes detected (e.g. on build, file might change
" while you have it open. Saves you having to type :e)
set autoread

"------------------------------------------------------------
" Indentation options
"
set shiftwidth=2
set softtabstop=2
set expandtab

"------------------------------------------------------------
" syntax highlighting
"
set t_Co=256
syntax on
set background=dark
colorscheme PaperColor

"------------------------------------------------------------
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
"map <Leader>v :call Vspec()<CR>
"map <Leader>h :call Hspec()<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" open new tab
map <Leader>t :tab sp<CR>

" remap escape key with jj only when in insert mode
imap jj <esc>

" copy current path with rspec command
" map <Leader>y :let @+ = \"bundle exec rspec \" . expand(\"%\")<CR>

"-----------------------------------------------------------
" NERDTREE
"
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter = "\u00a0"

"-----------------------------------------------------------
" TAGBAR (toggle with ctrl+m)
"
map <C-m> :TagbarToggle<CR>

"----------------------------------------------------------
"CTRL-P
"
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"---------------------------------------------------------
" RULER FOR COLUMN 80
"
set colorcolumn=80

"--------------------------------------------------------
" GLOBAL CLIPBOARD
"
set clipboard=unnamed

"-------------------------------------------------------
" DISABLE THE CREATION OF SWAPFILES
set noswapfile
set nowb
set nobackup

"-------------------------------------------------------
" RELATIVE LINE NUMBERS (BOTH == HYBRID)
"
set relativenumber
set number

"-------------------------------------------------------
" CTRL-P SILVER SEARCHER
"
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"-------------------------------------------------------
" INCREMENTAL SEARCH FOR /
"
set incsearch

"-------------------------------------------------------
" SYNTAX HIGHLIGHTING FOR EJS FILES
"
au BufNewFile,BufRead *.ejs set filetype=html

"-------------------------------------------------------
" SYNTAX HIGHLIGHTING FOR JS AND JSX FILES
"
let g:jsx_ext_required = 0

"-------------------------------------------------------
" JS BEAUTIFY
" (hold ctrl and press c followed by f)
"
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"-------------------------------------------------------

"-------------------------------------------------------
" TYPESCRIPT HINTS (tsuquyomi plugin)
"
autocmd FileType typescript nmap <buffer> <Leader>l : <C-u>echo tsuquyomi#hint()<CR>
