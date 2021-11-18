set number relativenumber 
set hidden                      " Allow multiple hidden buffers
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set noerrorbells                " Don't play sound on error
set tabstop=4 softtabstop=4     " Tabs to spaces
set shiftwidth=4                " Indent width when using <>
set expandtab                   " Automatically turn tab to space
set smartindent                 " Detect file indentation
set smartcase                   " Smart case on search
set ignorecase                  " Ignore case on search
set noswapfile                  " Don't write swap files
set nobackup                    " Don't make backups
set undodir=~/.vim/undodir      " Where to save undo history
set undofile                    " Enable the undo saving
set incsearch                   " Start searching before enter is pressed
set termguicolors               " Enable 24 bit colors
set scrolloff=8                 " Scroll line offser kept above cursor
set noshowmode                  " Don't print mode in status line
set encoding=utf-8              " default encoding for buffers
set fileencoding=utf-8          " default encoding for files
set fileencodings=utf-8         " same as above but it is a list
set backspace=indent,eol,start  " Backspace/Ctrl-H settings
set splitright                  " :vspclit creates right window
set hlsearch                    " Highlight all search matches
set fileformats=unix,dos,mac    " file formats
set splitbelow                  " :split creates below window
set nowritebackup               " No backup before write
set noequalalways               " Don't change window sizes when opening new
set updatetime=50               " Makes things faster
set shortmess+=c                " Don't pass messages to |ins-completion-menu|.
set mousemodel=popup            " Mouse right click opens term menu (if exists)
set mouse=a                     " Mouse enabled in all modes/features
set t_Co=256                    " Something about tmux and colors :/
set laststatus=2                " Always show Status bar
set modeline                    " Reads a special line `# vim:` on
set modelines=10                " top of files to change local configs
set title                       " Pass file title to terminal title
set titleold="Terminal"         " Default title to be set
set titlestring=%F              " format for the title using pritf
set list                        " Show tabs and spavces visually
set nojoinspaces                " No space when joining lines
set confirm                     " Dialog to confirm operations
set virtualedit=block           " Allow placing cursor where there is no char
set showbreak=↳
set colorcolumn=80,100,120
set listchars+=tab:→→\,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

set omnifunc=jedi#completions
set completeopt=menuone,longest,preview

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
