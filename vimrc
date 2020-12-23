" editor configs
syntax enable
set backspace=2
set ts=4 sts=4 sw=4 et ai si
set number
set hlsearch
set nofoldenable                   " I don't like fold
set fileencodings=utf8,euc-kr      " to open euc-kr encoded files
set colorcolumn=80
set timeoutlen=1000 ttimeoutlen=0  " Remove ESC delay
highlight ColorColumn ctermbg=DarkRed
highlight ColorColumn guibg=DarkRed
highlight Search ctermbg=Yellow ctermfg=Black cterm=none
highlight Search guibg=Yellow guifg=Black

" plugin configs
call plug#begin('~/.vim/plugged')

  " install vim-plug
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  " theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " code
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'davidhalter/jedi-vim'
  " git
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/committia.vim'

call plug#end()

" plugin-relative theme configs
let g:airline_powerline_fonts = 1
set laststatus=2
highlight! CocInfoSign guifg=Black
highlight! CocWarningSign guifg=Black
highlight! CocErrorSign guifg=Black
