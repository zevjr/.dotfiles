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
  Plug 'tpope/vim-commentary'

  Plug 'vim-airline/vim-airline'

  Plug 'williamboman/nvim-lsp-installer'
  Plug 'neovim/nvim-lspconfig/'
  Plug 'tamago324/nlsp-settings.nvim'
  Plug 'rcarriga/nvim-notify'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'folke/lua-dev.nvim'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

  Plug 'gruvbox-community/gruvbox'
  Plug 'ThePrimeagen/harpoon'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/trouble.nvim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-fugitive'
  Plug 'stsewd/isort.nvim'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'windwp/nvim-autopairs'

  Plug 'hashivim/vim-terraform'
  Plug 'psf/black', { 'branch': 'stable' }
  Plug 'ap/vim-buftabline'

  Plug 'lvim-tech/lvim-helper'

  Plug 'ixru/nvim-markdown'

  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'ThePrimeagen/refactoring.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
