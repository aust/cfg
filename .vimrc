set nocompatible              " required
filetype off                  " required

set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" *** Plugins begin

" Code folding
Plugin 'tmhedberg/SimpylFold'

" Python indentation
Plugin 'vim-scripts/indentpython.vim'

" Auto complete
Bundle 'Valloric/YouCompleteMe'

" Syntax checking on each save
Plugin 'vim-syntastic/syntastic'

" PEP8 checking
Plugin 'nvie/vim-flake8'

" Use Zenburn color scheme (terminal mode)
Plugin 'jnurmine/Zenburn'

" File tree
Plugin 'scrooloose/nerdtree'

" Use tabs with NERDTree
Plugin 'jistr/vim-nerdtree-tabs'

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" *** Plugins end

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" SimpylFold Configuration

" Show docstrings for folded code
let g:SimpylFold_doscstring_preview=1

" YouCompleteMe Configuration

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree Configuration

" Ignore .pyc and ~ files
let NERDTreeIgnore=['\.pyc$', '\~$']

" *** Other configuration

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" *** Code related configuration
" Use ftypes if needed: http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean

" Proper configuration for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" Full stack settings
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Turn highlighting on
let python_highlight_all=1
syntax on

colorscheme zenburn

" Enable line numbering
set nu

" Enable macOS clipboard
set clipboard=unnamed

