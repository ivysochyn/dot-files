" Disable mouse mode
set mouse=

" Set tab size to 4 spaces
set tabstop=4

" Set indent size to 4 spaces
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

" Number of entries to keep in the command line history
set history=1000

" Save and restore global variables, registers, and command-line history
set shada+=!

" Set undo file
set undofile

" Enable line numbers
set number

" Macro to remove trailing whitespaces
map <F4> :%s/\s\+$//e<Enter>

" Colorscheme
if (has("termguicolors"))
 set termguicolors
endif

colorscheme peaksea

" Plugin manager section
call plug#begin()
" Show trailing whitespaces
Plug 'lukoshkin/trailing-whitespace', { 'branch': 'vimscript' }
call plug#end()
