set nocompatible " Disable compatibility with vi

filetype on      " File type detection
filetype plugin on " Enable plugins and load plugin for the detected file type.
filetype indent on " Load an indent file for the detected file type.

syntax on " Syntax highlighting 

set number " Line numbers
set relativenumber " Line numbers from the cursor position

set cursorline " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn " Highlight cursor line underneath the cursor vertically.

set tabstop=4 " Set tab width to 4 columns.
set shiftwidth=4 " Set shift width to 4 spaces.
set smarttab
"set expandtab " Use space characters instead of tabs.
set softtabstop=4 "4 spaces in one tab
set autoindent " ??

set t_Co=256 " 256 colors in terminal(gnome-terminal for ex.)

set mousehide "Спрятать курсор мыши когда набираем текст
set mouse=a "Включить поддержку мыши

set termencoding=utf-8 "Кодировка терминала
set encoding=UTF-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251

set novisualbell "Не мигать
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
set visualbell t_vb= "Выключаем звук в Vim

set splitbelow splitright " vsp & sp по умолчанию вниз и вправо
set backspace=indent,eol,start whichwrap+=<,>,[,] "Удобное поведение backspace
set showtabline=1 "Вырубаем черточки на табах

set nowrap "Не переносим на другую строчку
set linebreak "Разрываем строки

set nobackup " Выключаем ~ резервные файлы
set noswapfile " Выключаем swap

set clipboard=unnamed
set ruler
set hidden
set guifont=Monaco:h18
"set wildmode=full "Complete longest common string, then each full match
set wildmenu
set wildmode=longest,list,full
" Disable automatic commetnig on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" SEARCH OPTIONS ---------------------------------------------------------------- {{{
" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
" Set the backslash as the leader key.
let mapleader = '\'
" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``
" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>
" Type jj to exit insert mode quickly.
inoremap jj <Esc>
" Press the space bar to type the : character in command mode.
nnoremap <space> :
" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>
" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz
" Yank from cursor to the end of line.
nnoremap Y y$
" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>
" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Folding toggle by space
nnoremap <space> za

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']


" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
"Plug 'ryanoasis/vim-devicons'
call plug#end()

" }}}

" PLUGIN DEPENDENT OPTIONS ---------------------------------------------------------------- {{{

colorscheme OceanicNext
let g:airline_theme='dark'

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
