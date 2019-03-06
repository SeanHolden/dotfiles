" Requirements:
" neovim
" Python 3 for deoplete
" pynvim (neovim python client) for deoplete https://github.com/neovim/pynvim
" tern (install globally) for JS autocomplete https://www.npmjs.com/package/tern
" vim-plug (neovim) to run :PlugInstall https://github.com/junegunn/vim-plug
" Once all the above is installed, open neovim and run :PlugInstall
"
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
  " Syntax highlighting plugin
  Plug 'leafgarland/typescript-vim'
  " Typescript completion and compile errors
  Plug 'Quramy/tsuquyomi'
  " Colorschemes
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'srcery-colors/srcery-vim'
  " vim wrapper for running tests
  Plug 'janko-m/vim-test'
  " Go language support for Vim
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  if has("nvim")
    " autocomplete (neovim only)
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " autocomplete for Go specifically (neovim only)
    Plug 'zchee/deoplete-go'
    " autocomplete for JS (requires ternjs installed globally)
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  endif
  " Tagbar (works with ctags)
  Plug 'majutsushi/tagbar'
  " Git plugin. Adds things like :Gblame, :Gsplit, :Gstatus, :Gcommit, :Gdiff
  Plug 'tpope/vim-fugitive'
  " Auto real-time linting
  Plug 'w0rp/ale'
  " Statusbar/tabline at bottom of editor
  Plug 'vim-airline/vim-airline'
  " asynchronously run programs.
  Plug 'neomake/neomake'
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
au FocusGained * :checktime

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
"colorscheme PaperColor
colorscheme srcery

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

" quicker saving with space followed by ;
nnoremap <Space>; :w<CR>

"-----------------------------------------------------------
" PYTHON
"
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
"-----------------------------------------------------------

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
map <C-b> :TagbarToggle<CR>
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

"-------------------------------------------------------
" VIM TEST MAPPINGS
" (e.g. press t then hold ctrl followed by n)
"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" The built-in mapping for exiting terminal insert mode in neovim is CTRL-\ CTRL-n,
" which is difficult to press, so map it to CTRL-o
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
"-------------------------------------------------------

"-------------------------------------------------------
" VIM-GO SETTINGS
"
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_def_mode = 'guru' " choices: ['guru', 'godef'] default is 'guru'
" ctrl g => list all declarations in current file
nmap <C-g> :GoDecls<cr>
"-------------------------------------------------------

"-------------------------------------------------------
" DEOPLETE SETTINGS
"
let g:deoplete#enable_at_startup = 1
"-------------------------------------------------------

"-------------------------------------------------------
" DEOPLETE GO SETTINGS
"
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
"-------------------------------------------------------

"-------------------------------------------------------
" ALE SETTINGS
"
" g: is for global, b: is for buffer
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <silent> <C-k> :ALEPrevious<CR>
nmap <silent> <C-j> :ALENext<CR>
let g:ale_linter_aliases = {
\   'jsx': ['css', 'javascript']
\}
let g:ale_linters = {
\   'jsx': ['stylelint', 'eslint'],
\   'javascript': ['stylelint', 'eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint', 'stylelint'],
\}
" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
"-------------------------------------------------------

"-------------------------------------------------------
" NEOMAKE SETTINGS
"
autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }
"-------------------------------------------------------
