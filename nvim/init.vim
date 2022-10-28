set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" other scripts
lua require('plugins')
let g:airline_theme='base16'
