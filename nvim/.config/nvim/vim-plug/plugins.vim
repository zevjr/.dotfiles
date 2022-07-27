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

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'rcarriga/nvim-notify'

    Plug 'gruvbox-community/gruvbox'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'

    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-fugitive'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'windwp/nvim-autopairs'

    Plug 'lvim-tech/lvim-helper'

    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'ThePrimeagen/refactoring.nvim'
    Plug 'ThePrimeagen/harpoon'

    Plug 'thinca/vim-fontzoom'

    Plug 'preservim/tagbar'

    " nerdtree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'PhilRunninger/nerdtree-visual-selection'

    "Themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'


    """ head of open files in vim 
    Plug 'ap/vim-buftabline'

    """ fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

    """ lSP
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'tamago324/nlsp-settings.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'


    """ Neovim Tree shitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'romgrk/nvim-treesitter-context'

    """COC
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    """ Lua
    Plug 'folke/lua-dev.nvim'

    """ Typescript
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    """ Prettier
    Plug 'sbdchd/neoformat'

    """ Python
    Plug 'psf/black', { 'branch': 'stable' }
    Plug 'stsewd/isort.nvim'
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

    """ Markdown
    " Plug 'ixru/nvim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    """ Terraform
    Plug 'hashivim/vim-terraform'
    
    """ Copilot
    Plug 'github/copilot.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
