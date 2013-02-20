" --------------------- "
"  Basic Configuration  "
" --------------------- "
" Set the default shell "
set shell=/bin/zsh

" In-order list of where to store swap files "
set directory=~/.vim/tmp/swp//,~/.tmp//,/var/tmp//,.

" Create a backup copy when writing, but don't save it "
set writebackup
set nobackup

" Don't allow vi compatibility (necessary for other options) "
set nocompatible

" Set filesystem options for EOF characters "
" (Change this order depending on the host machine) "
set ffs=unix,dos,mac

" File type detection "
filetype plugin on

" Fast terminal operation "
set ttyfast

" Lazy redraw to speed up macro processing "
set lazyredraw

" Allow hidden buffers "
set hidden

" Read changes to buffered files automatically "
set autoread

" Automatically reload vimrc when it's edited "
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" Automatically change the directory to the current window "
autocmd BufEnter * silent! lcd %:p:h

" --------------- "
"  Text Encoding  "
" --------------- "
" Set UTF-8 encoding "
set encoding=utf8

" Set the default language to US English, if available "
try
    lang en_US
catch
endtry

" ------------ "
"  Appearance  "
" ------------ "
" Disable audiovisual error feedback "
set noerrorbells novisualbell

" Set the title of the terminal with file information "
set title

" Background shell color (for color adjustment) "
set bg=dark

" Set 256 colors on the terminal "
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

" Turn line numbers on "
set number

" Use 3 columns by default for the line numbers "
set numberwidth=3

" Always show the status bar "
set laststatus=2

" Configure the status bar "
set statusline=%F%m%r%h%w[%{&ff}]%y[%L][%p%%][%03l,%03v]
"              | | | | |  |      |  |   |     |    |
"              | | | | |  |      |  |   |     |    +-Column number
"              | | | | |  |      |  |   |     +----Line number
"              | | | | |  |      |  |   +--------File progress
"              | | | | |  |      |  +----------Number of lines
"              | | | | |  |      +-----------Type of file
"              | | | | |  +----------------File format
"              | | | | +-----------------Preview flag
"              | | | +-----------------Help flag
"              | | +-----------------Read-only flag
"              | +-----------------Modified flag
"              +-----------------File path

" Set a [row,column] index in the lower right-hand corner "
set ruler

" Display the current mode "
set showmode

" Display current command "
set showcmd

" Enable syntax highlighting "
syntax enable

" Underline the cursor line "
set cursorline

" ------------- "
"  Indentation  "
" ------------- "
" Automatically indent newlines (overridden by filetype indentation) "
set autoindent smartindent

" Filetype indentation (overrides manual indentation) "
filetype plugin indent on

" Change tabs to spaces, and set the length of a tab to 4 characters "
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Allow for easy navigation and deletion of tabs"
set smarttab

" Allow backspace to delete all input characters "
set backspace=indent,eol,start

" --------------- "
"    Wrapping     "
" --------------- "
" Display five lines above and below the cursor "
set scrolloff=5

" Display 10 characters to the left and right of the cursor "
set sidescrolloff=15

" Compact syntax to avoid "Hit ENTER to continue" prompts "
set shortmess=a

" Insert comment leaders, allow comment formatting, and format paragraph text "
set formatoptions=rq2

" Highlight lines over 80 characters "
highlight OverLength ctermbg=green ctermfg=white guibg=green
match OverLength /\%80v.\+/

" -------- "
"  Search  "
" -------- "
" Update search results as I type "
set incsearch

" Highlight searched terms "
set hlsearch

" Ignore case in searches unless explicitly typed "
set ignorecase
set smartcase

" Quickly switch to matching bracket when inserted "
set showmatch

" Match brackets for 300ms "
set matchtime=3

" Turn on the wildcard matching menu (this is enabled by default by "
" the full option in wildmode, but is turned on here for completion) "
set wildmenu

" File name completion will display a list based on the full "
" text of the input and complete the first match automatically "
set wildmode=list:longest,full

" -------------- "
"  Key Mappings  "
" -------------- "
" Change the leader key to comma (default: backslash)"
let mapleader=","

" Toggle search highlighting by pressing ,h "
nnoremap <leader>h :set hlsearch! hlsearch?<CR>

" Remove leading spaces with ,ls "
nnoremap <leader>ls :%s/^\s*//e<CR>

" Remove trailing spaces with ,ts "
"nnoremap <leader>ts :%s/\s\+$//e<CR>
nnoremap <leader>ts :%s/\s *$//e<CR>

" Toggle spell check with ,sp "
nnoremap <leader>sp :setlocal spell!<CR>

" --------- "
"  History  "
" --------- "
" Save history into the .viminfo file "
set viminfo='10,\"100,:20,%,n~/.viminfo
"           |    |    |   | |
"           |    |    |   | +-Where to save .viminfo files
"           |    |    |   +-Save and restor buffer list
"           |    |    +---Save up to 20 lines of command history
"           |    +------Save up to 100 lines for each register
"           +---------Remember up to 10 previously edited files

" Restore history from .viminfo on launch "
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

" Make sure autocommands aren't doubly run "
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
	    au BufWinEnter * call ResCur()
endif

" --------------- "
"    Optional
" --------------- "
" Set the number of undos "
"set undolevels=x
" Set the number of undo lines to be written to the undo file "
"set undorelad=x
" Update the swap file every x number of characters "
"set updatecount=x"
" Set the history to be x commands in each buffer "
"set history=x"

"set up code folding
"set nofoldenable     "don't fold by default
"set foldmethod=indent   " fold on indentations
"set foldnestmax=10   "only fold up to 10 levels
"set foldlevel=1     " only show me first fold level
" Set the number of undos "
"set undolevels=x
" Set the number of undo lines to be written to the undo file "
"set undorelad=x
" Update the swap file every x number of characters "
"set updatecount=x"
" Set the history to be x commands in each buffer "
"set history=x"

"set up code folding
"set nofoldenable     "don't fold by default
"set foldmethod=indent   " fold on indentations
"set foldnestmax=10   "only fold up to 10 levels
"set foldlevel=1     " only show me first fold level

" Height of the command prompt "
" set cmdheight=2 "

" Height of the command window "
" set cmdwindowheight=3 "

" Line wrapping (visual only)"
" set wrap "

" Only break on breakat option characters "
" set linebreak "

" Don't wrap while writing "
" set textwidth=0 "
" set wrapmargin=0 "o
