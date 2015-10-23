
set nocompatible

" required by vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let vundle manage vundle DISABLED: should be handled as submodule by
" homeshick
" Plugin 'VundleVim/Vundle.vim'

" 'real' plugins
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'TaskList.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jreybert/vimagit'

" language plugins
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rodjek/vim-puppet'
Plugin 'tikhomirov/vim-glsl'
Plugin 'fatih/vim-go'
Plugin 'vim-perl/vim-perl'
Plugin 'digitaltoad/vim-jade'
" Plugin 'kovisoft/slimv'
Plugin 'spwhitt/vim-nix'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/paredit.vim'
" Plugin 'MarcWeber/vim-addon-nix'
Plugin 'Shougo/vimproc.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi' " also typescript stuff

" themes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" colors
set t_Co=256
colorscheme mustang
"set background=dark
"colorscheme solarized

"set rtp+=~/.local/lib64/python3.3/site-packages/powerline/bindings/vim


" syntax
syntax enable
filetype plugin indent on

" search
set ignorecase
set smartcase
set incsearch

set wildmenu
set wildmode=list:full,full

" enable smart autocomplete (uses ctags!)
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" C-p
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" example link to exclude
"  \ 'link': 'some_bad_symbolic_links',

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
"augroup mySyntastic
"  au!
"  au FileType tex let b:syntastic_mode = "passive"
"augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
" set to 2 to generate local tag files, not just use them
let g:easytags_dynamic_files = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" line numbers
set number
set relativenumber

" my mappings
let mapleader = "\<SPACE>"

" autocompletion stuff
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
" change enter key to insert completion:
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" escape to exit completion
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
" up/down arrow to select
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" scroll with page up/down
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ctrlp_map = '<c-p>'

" file commands
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <leader>feo :edit $MYVIMRC<cr>
nnoremap <leader>fes :source $MYVIMRC<cr>
" toggles
nnoremap <leader>tt :NERDTreeToggle<cr>
nnoremap <silent><leader>tn :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>
nnoremap <silent><leader>tb :TagbarToggle<CR>
" window management
nnoremap <silent><leader>ws :split<cr>
nnoremap <silent><leader>wv :vsplit<cr>
nnoremap <silent><leader>wc :close<cr>
nnoremap <silent><leader>wh :wincmd h<cr>
nnoremap <silent><leader>wj :wincmd j<cr>
nnoremap <silent><leader>wk :wincmd k<cr>
nnoremap <silent><leader>wl :wincmd l<cr>
" quickfix window
nnoremap <silent><leader>wq :cwindow<cr>
" buffer management
nnoremap <silent><leader>bd :bd<cr>
nnoremap <silent><leader>bf :CtrlPBuffer<cr>
nnoremap <silent><leader>bl :buffers<cr>:buffer<space>

" escape is to far away
inoremap jk <esc>
inoremap <esc> nop

" airline all the time
set laststatus=2
set noshowmode

" open NerdTree if no file name was given
autocmd vimenter * if !argc() | NERDTree | endif
