set nocompatible

let g:python_host_prog='/PATH/TO/PYTHON2'
let g:python3_host_prog='/PATH/TO/PYTHON3'

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/committia.vim'
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'achimnol/python-syntax'
Plug 'chrisbra/Recover.vim'
Plug 'zchee/deoplete-jedi'

" don't use but log
"Plug 'dag/vim2hs'
"Plug 'davidhalter/jedi-vim'

call plug#end()

" default settings
source $HOME/.vimrc

" airline settings
let g:airline_powerline_fonts = 1
set laststatus=2

" enable python-syntax
let python_highlight_all = 1

" prevent jedi-vim bug
let g:jedi#call_signature_escape="'=`='"

" ale lints haskell
let g:ale_linters = { 'haskell': ['stack-build', 'hlint'] }

" use deoplete
let g:deoplete#enable_at_startup = 1
