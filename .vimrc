colorscheme obsidian2
set guifont=Menlo\ Regular:h15
set splitright
execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"
set number
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set swapfile
set dir=~/tmp
set nowrap
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

