" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Refs:
"   FZF: https://www.chrisatmachine.com/Neovim/08-fz


call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug']}
  Plug 'Yggdroot/indentLine'
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-commentary'

  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'

  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'preservim/tagbar'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/git-messenger.vim'

  Plug 'mboughaba/i3config.vim'

  Plug 'petobens/poet-v'

  Plug 'mileszs/ack.vim'

  Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
  Plug 'fisadev/vim-isort'
  Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}

  Plug 'matze/vim-move'

  Plug 'dense-analysis/ale'

  Plug 'erietz/vim-terminator'

  Plug 'justinmk/vim-sneak'

  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'neovim/nvim-lsp'
  Plug 'neovim/nvim-lspconfig'

  Plug 'deoplete-plugins/deoplete-jedi'
  " Plug 'davidhalter/jedi-vim'
  Plug 'airblade/vim-rooter'

  " Fzf
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }


  " Themes
  Plug 'gruvbox-community/gruvbox'
  Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
  Plug 'arcticicestudio/nord-vim'
  Plug 'rakr/vim-one'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tomasiser/vim-code-dark'
  Plug 'flazz/vim-colorschemes'
  Plug 'chriskempson/base16-vim'



    "" Markdown editing and preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  Plug 'gabrielelana/vim-markdown' " Linting and highlight
  Plug 'reedes/vim-pencil' " Soft or Hard Word Wrapping - :SoftPencil
  Plug 'junegunn/goyo.vim' " Distraction free - :Goyo
  Plug 'godlygeek/tabular' " Align tables - :Tabularize


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
