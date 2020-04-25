" -*- mode: vimrc -*-
"vim: ft=vim

" install / load plug (plugin manager)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'Raimondi/delimitMate'
"Plug 'jreybert/vimagit'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

let mapleader = ' '

" airline config
let g:airline_powerline_fonts = 1

" CtrlP (fuzzy find) config
nnoremap <Leader>f :CtrlPMixed<CR>
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_switch_buffer = 'et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"  \ 'link': 'some_bad_symbolic_links',

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" editorconfig config
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']


colorscheme mustang

" line numbers
set number
set relativenumber

" persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
call system('mkdir -p $HOME/.vim/undo')

" keybindings
" buffers
nnoremap <Leader>be :new<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bo :edit 
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>g :!lazygit<CR>
