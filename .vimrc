colorscheme obsidian2
execute pathogen#infect()
syntax on
filetype plugin indent on

set guifont=Menlo\ Regular:h15
set splitright
set laststatus=2
set statusline+=%F
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set swapfile
set dir=~/tmp
set backupdir=~/tmp
set undodir=~/tmp
set nowrap
set backspace=indent,eol,start
set nohlsearch
set incsearch
set lazyredraw
set mouse=r " disable mouse clicks so copying from terminal still works
set ffs=unix,dos
set ff=unix

let mapleader = " "

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap ; :
nnoremap : ;
nnoremap v V
nnoremap V v
nnoremap <enter> o<esc>

" vim-rails keymappings
nnoremap <leader>ec :Econtroller<space>
nnoremap <leader>em :Emodel<space>

" switch to buffer number n
nnoremap <leader>1 1<C-^>
nnoremap <leader>2 2<C-^>
nnoremap <leader>3 3<C-^>
nnoremap <leader>4 4<C-^>
nnoremap <leader>5 5<C-^>
nnoremap <leader>6 6<C-^>
nnoremap <leader>7 7<C-^>
nnoremap <leader>8 8<C-^>
nnoremap <leader>9 9<C-^>
nnoremap <leader>p <C-w>w

inoremap jj <ESC>

map <C-j> ;bnext!<CR>
map <C-k> ;bprev!<CR>
map <C-h> 20zh " Scroll to the left
map <C-l> 20zl " Scroll to the right
map <Leader> <Plug>(easymotion-prefix)

" highlight trailing whitespace
hi link ExtraWhitespace Error
au BufNewFile,BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ " except current line

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    %s///e
    retab
    call cursor(l, c)
endfun

" strip trailing whitespace on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" search visually selected text
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>
