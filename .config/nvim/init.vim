" define a group `vimrc` and initialize.
augroup vimrc
    autocmd!
augroup END

source $HOME/.config/nvim/nvimrc_plugins
source $HOME/.config/nvim/nvimrc_custom
source $HOME/.config/nvim/nvimrc_statusline
source $HOME/.config/nvim/nvimrc_keybindings

" Enable file type detection.
filetype plugin indent on

" Colorscheme
syntax enable
if filereadable($HOME."/.colors") && match(readfile($HOME."/.colors"),"light")
    set background=dark
    let g:rehash256 = 1
    colorscheme molokai
    " colorscheme monokai
    " let g:solarized_termcolors=256
    " colorscheme solarized
else
    set background=light
    let g:solarized_termcolors=256
    colorscheme solarized
endif

" copy and pasting in OS X
set cb=unnamedplus

" display
set cursorline                    " highlight current line
"set number                        " enable line numbers
set number relativenumber
"set relativenumber                " show relative numbers for all lines but the current one
set ruler                         " show the cursor position all the time
set incsearch                     " do incremental searching
set ignorecase                    " smart case sensitive search
set smartcase                     " case sensitive if search term contains one capital letter
set hls                           " hightlight search results
set scrolloff=5 sidescrolloff=10  " keep some lines before and after the cursor visible
set wrap                          " break long lines
set linebreak                     " break only at word boundary
set listchars=tab:⊳\ ,trail:·     " display whitespaces
set list                          "
set breakindent                   " indent wrapped lines
set breakindentopt=shift:2
set display=lastline,uhex         " if last line does not fit on screen, display it anyways

" editing
set gdefault                      " substitute all occurrences in line per default
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set tabstop=2                     " size of a hard tabstop
set shiftwidth=2                  " size of an "indent"
set softtabstop=2                 " a combination of spaces and tabs are used to simulate tab stops at a width
set smarttab                      " make "tab" insert indents instead of tabs at the beginning of a line
set expandtab                     " always uses spaces instead of tab characters
set virtualedit=block,onemore
set nostartofline                 " keep column position when switching buffers

" behavior
set hidden                        " switch from unsaved buffers
set shell=/bin/zsh
set encoding=utf-8
set history=10000                 " keep x lines of command line history
set showcmd                       " display incomplete commands
set wildmenu                      " better command line completion
set wildmode=list:longest,full
set lazyredraw                    " performance: dont redraw while executing macros
set autoread                      " read file when changed from outside
set confirm                       " ask to save files when closing vim
set wildignore=*.o,*.obj,*.class,target/**
set viewoptions=cursor,folds,slash,unix

" backup/undo/swap files
set swapfile
set backup
set undofile

set undodir=$HOME/.config/nvim/tmp/undo//     " undo files
set backupdir=$HOME/.config/nvim/tmp/backup// " backups
set directory=$HOME/.config/nvim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" change directory to the current buffer when opening files.
" set autochdir
" autocmd vimrc BufEnter * silent! lcd %:p:h

" break text automatically
autocmd vimrc FileType text setlocal textwidth=80

let g:tex_flavor = "latex"

"set spell spelllang=en_us

" filetype aliases
" autocmd vimrc BufNewFile,BufRead *.gdb set filetype=sh

" on save, autoformat - also removes trailing spaces
au BufWritePre * :Autoformat

" return to last edit position when opening a file.
" except for git commits: Enter insert mode instead.
autocmd vimrc BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   if &filetype == 'gitcommit' |
            \       setlocal spell |
            \       startinsert |
            \   else |
            \      exe "normal! g`\"" |
            \    endif |
            \ endif

" neovim: automatically close terminal when process exited
autocmd TermClose * call feedkeys('<cr>')
