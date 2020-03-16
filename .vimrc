set encoding=utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if (has("termguicolors"))
  set termguicolors
endif

call plug#begin('~/.vim/plugged')

" *** Plugs begin

" Code folding
Plug 'tmhedberg/SimpylFold'

" Python indentation
Plug 'vim-scripts/indentpython.vim'

" Auto complete
Plug 'ycm-core/YouCompleteMe'

" Syntax checking on each save
Plug 'vim-syntastic/syntastic'

" PEP8 checking
Plug 'nvie/vim-flake8'

" Use Zenburn color scheme (terminal mode)
Plug 'jnurmine/Zenburn'

" File tree
Plug 'scrooloose/nerdtree'

" Use tabs with NERDTree
Plug 'jistr/vim-nerdtree-tabs'

" Git integration
Plug 'tpope/vim-fugitive'

" Powerline
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" *** Plugs end

" All of your Plugs must be added before the following line
call plug#end()            " required

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
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
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
au BufNewFile,BufRead *.js,*.jsx,*.yml,*.ts,*.tsx,*.json,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Turn highlighting on
let python_highlight_all=1
syntax on

colorscheme zenburn

" Enable line numbering
set nu

" Enable macOS clipboard
set clipboard=unnamed

