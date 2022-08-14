" editor configs
syntax enable
set backspace=2
set ts=2 sts=2 sw=2 et ai si
set number
set hlsearch
set nofoldenable                   " I don't like fold
set fileencodings=utf8,euc-kr      " to open euc-kr encoded files
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
  Plug 'hashivim/vim-terraform'
  Plug 'sheerun/vim-polyglot'
  Plug 'styled-components/vim-styled-components'
  " git
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/committia.vim'

call plug#end()

" plugin-relative theme configs
let g:airline_powerline_fonts = 1
set laststatus=2
highlight CocFloating ctermbg=Black

" plugin-relative code configs
let g:terraform_fmt_on_save = 1

" per file type
au FileType python setl colorcolumn=80 ts=4 sts=4 sw=4
au FileType typescript setl colorcolumn=121
au FileType typescriptreact setl colorcolumn=121
au FileType javascript setl colorcolumn=121
au FileType javascriptreact setl colorcolumn=121
au BufEnter * syntax sync fromstart

" coc configs from https://github.com/neoclide/coc.nvim

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Use K to show documentation in preview window.
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction
  nnoremap <silent> K :call ShowDocumentation()<CR>

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')
