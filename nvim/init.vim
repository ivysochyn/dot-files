" Disable mouse mode
set mouse=

" Enable line numbers
set number

" Macro to remove trailing whitespaces
map <F4> :%s/\s\+$//e<Enter>

" Plugin manager section
call plug#begin()
" Show trailing whitespaces
Plug 'lukoshkin/trailing-whitespace', { 'branch': 'vimscript' }
call plug#end()
