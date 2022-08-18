source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
" source $HOME/.config/nvim/plug-config/coc/coc.vim 
" source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
source $HOME/.config/nvim/maps.vim
source $HOME/.config/nvim/default.vim
source $HOME/.config/nvim/config.lua

syntax on
filetype plugin indent on

autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" COLORSCHEMA

colorscheme gruvbox
set guifont=TerminessTTF\ Nerd\ Font:pixelsize=14
let g:airline_powerline_fonts = 0
let g:airline_theme='minimalist'
let g:gruvbox_italic=1
let g:indentLine_enabled = 0    " Enables indentline plugin

let python_highlight_all = 1
let g:isort_command = 'isort'
let g:black_fast = 1

" let base16colorspace=256
" let g:gruvbox_contrast_dark = 'hard'       " Set gruvbox bg to real dark
" let g:gruvbox_invert_selection='0'         " Don't invert selection
" let g:gruvbox_material_background = 'hard' " Same but for -material alt
" let g:gruvbox_termcolors=256
" let g:indentLine_char = '┆'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_concealcursor = 0
" let g:indentLine_faster = 1
" set background=dark                        " Set global background to dark
" set guifont= NotoSansMono\ Nerd,\ 32
" set guifont=Screen15,\ 7x13,NotoSansMono\\,32\\,commas
"

" BASIC CONFIG

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

let g:python3_host_prog = '/usr/bin/python3.10'
let g:vim_isort_config_overrides = {
  \ 'include_trailing_comma': 1, 'multi_line_output': 3}
let g:vim_isort_python_version = 'python3'


augroup exe_code
    autocmd!

    autocmd FileType python nnoremap <buffer> <leader>r :10sp<CR> :term python3 %<CR> :startinsert<CR>
augroup END

let g:use_splits_not_buffers = 'right'
let g:popup_on_dot = 0

let g:black#settings = {
    \ 'fast': 1,
    \ 'line_length': 100
\}

let g:ale_linters = {}
:call extend(g:ale_linters, {
    \'python': ['flake8'], })
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R .'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g ""'
let g:ackprg = 'ag --vimgrep'
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0


function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

lua <<EOF
 print("Seja bem-vindo ao Neovim!")
EOF
