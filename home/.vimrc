
set nocompatible

" required by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle DISABLED: should be handled as submodule by
" homeshick
" Bundle 'gmarik/vundle'

" 'real' plugins
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'TaskList.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'majutsushi/tagbar'
Bundle 'airblade/vim-gitgutter'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'tpope/vim-surround'
Bundle 'editorconfig/editorconfig-vim'

" language plugins
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'rodjek/vim-puppet'
Bundle 'tikhomirov/vim-glsl'
Bundle 'fatih/vim-go'
Bundle 'c9s/perlomni.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'kovisoft/slimv'
Bundle 'spwhitt/vim-nix'
Bundle 'kchmck/vim-coffee-script'
" Bundle 'MarcWeber/vim-addon-nix'

" themes
Bundle 'altercation/vim-colors-solarized'
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

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
" enable smart autocomplete (uses ctags!)
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
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

" C-p
let g:ctrlp_map = '<c-p>'
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
" Open/close tagbar with \b
nmap <silent> <leader>r :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" line numbers
set number

" my mappings
let mapleader = "\<SPACE>"
nnoremap <leader>re :edit $MYVIMRC<cr>
nnoremap <leader>rs :source $MYVIMRC<cr>
nnoremap <leader><TAB> <C-w>w
nnoremap <leader>l :NERDTreeToggle<cr>
nnoremap <Leader>o :CtrlPMixed<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>n :set number!<cr>



"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"if !exists('g:neocomplcache_keyword_patterns')
"	let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"	return neocomplcache#smart_close_popup() . "\<CR>"
"" For no inserting <CR> key.
""	return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
""       " <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""       " <C-h>, <BS>: close popup and delete backword char.
"noremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"noremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"noremap <expr><C-y>  neocomplcache#close_popup()
"noremap <expr><C-e>  neocomplcache#cancel_popup()
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"	let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"" neosnippet
"" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"" xmap <C-k>     <Plug>(neosnippet_expand_target)
"imap <expr><CR> neosnippet#expandable() ?
"			\ "\<Plug>(neosnippet_expand)"
"			\: "\<CR>"
"
"
"imap <expr><TAB> neosnippet#jumpable() ?
"			\ "\<Plug>(neosnippet_jump)"
"			\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#jumpable() ?
"			\ "\<Plug>(neosnippet_jump)"
"			\: "\<TAB>"
"
" airline all the time
set laststatus=2
set noshowmode

" hardcore mode without arrows keys
" basically learned to live without, might conflict with other stuff
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"vnoremap <Left> <Nop>
"vnoremap <Right> <Nop>
"vnoremap <Up> <Nop>
"vnoremap <Down> <Nop>
"nnoremap <Left> <Nop>
"nnoremap <Right> <Nop>
"nnoremap <Up> <Nop>
"nnoremap <Down> <Nop>

autocmd vimenter * if !argc() | NERDTree | endif
