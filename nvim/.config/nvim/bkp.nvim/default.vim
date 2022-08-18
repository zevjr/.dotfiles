" set colorcolumn=80,100,120
" set cursorcolumn                " Highlight current column
" set ignorecase                  " Ignore case on search
" set mousemodel=popup            " Mouse right click opens term menu (if exists)
" set smartcase                   " Smart case on search
" set smartindent                 " Detect file indentation
" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" set t_Co=256                    " Something about tmux and colors :/
" set termguicolors               " Enable 24 bit colors
" set titleold="Terminal"         " Default title to be set
set backspace=indent,eol,start  " Backspace/Ctrl-H settings
set completeopt=menuone,longest,preview
set confirm                     " Dialog to confirm operations
set cursorline                  " Highlight current line
set encoding=utf-8              " default encoding for buffers
set expandtab                   " Automatically turn tab to space
set fileencoding=utf-8          " default encoding for files
set fileencodings=utf-8         " same as above but it is a list
set fileformats=unix,dos,mac    " file formats
set hidden                      " Allow multiple hidden buffers
set hlsearch                    " Highlight all search matches
set incsearch                   " Start searching before enter is pressed
set laststatus=2                " Always show Status bar
set list                        " Show tabs and spavces visually
set listchars+=tab:→→\,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set modeline                    " Reads a special line `# vim:` on
set modelines=10                " top of files to change local configs
set mouse=a                     " Mouse enabled in all modes/features
set nobackup                    " Don't make backups
set noequalalways               " Don't change window sizes when opening new
set noerrorbells                " Don't play sound on error
set nojoinspaces                " No space when joining lines
set noshowmode                  " Don't print mode in status line
set noswapfile                  " Don't write swap files
set nowritebackup               " No backup before write
set number relativenumber 
set omnifunc=jedi#completions
set scrolloff=8                 " Scroll line offser kept above cursor
set shiftwidth=4                " Indent width when using <>
set shortmess+=c                " Don't pass messages to |ins-completion-menu|.
set showbreak=↳
set splitbelow                  " :split creates below window
set splitright                  " :vspclit creates right window
set tabstop=4 softtabstop=4     " Tabs to spaces
set title                       " Pass file title to terminal title
set titlestring=%F              " format for the title using pritf
set undodir=~/.vim/undodir      " Where to save undo history
set undofile                    " Enable the undo saving
set updatetime=50               " Makes things faster
set virtualedit=block           " Allow placing cursor where there is no char

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
