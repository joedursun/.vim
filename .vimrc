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
set runtimepath^=~/.vim/bundle/ag
set number
set swapfile
set dir=~/tmp
set nowrap
set backspace=indent,eol,start
set incsearch
set lazyredraw
set mouse=r " disable mouse clicks so copying from terminal still works

let mapleader = " "

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" silver searcher (Ag.vim)
let g:ag_working_path_mode="r"

nnoremap ; :
nnoremap : ;
nnoremap v V
nnoremap V v

" clear highlighted search terms
nnoremap <leader>k :noh<CR>

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
    call cursor(l, c)
endfun

" strip trailing whitespace on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

