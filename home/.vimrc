
set nocompatible

" required by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle DISABLED: should be handled as submodule by
" homeshick
" Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'c9s/perlomni.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'

" colors
set t_Co=256
colorscheme mustang

" syntax
syntax enable
filetype plugin indent on

" line numbers
set number

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
" For no inserting <CR> key.
"	return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
"       " <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"       " <C-h>, <BS>: close popup and delete backword char.
noremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
noremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
noremap <expr><C-y>  neocomplcache#close_popup()
noremap <expr><C-e>  neocomplcache#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neosnippet
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><CR> neosnippet#expandable() ? 
			\ "\<Plug>(neosnippet_expand)" 
			\: "\<CR>" 


imap <expr><TAB> neosnippet#jumpable() ?
			\ "\<Plug>(neosnippet_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
			\ "\<Plug>(neosnippet_jump)"
			\: "\<TAB>"

" airline all the time
set laststatus=2

" hardcore mode without arrows keys
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

autocmd vimenter * NERDTree
