" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'Luxed/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:ayu_italic_comment = 1 " defaults to 0.
let g:ayu_sign_contrast = 1 " defaults to 0. If set to 1, SignColumn and FoldColumn will have a higher contrast instead of using the Normal background
let g:ayu_extended_palette = 1 " defaults to 0. If set to 1, enables extended palette. Adds more colors to some highlights (function keyword, loops, conditionals, imports)

set termguicolors     " enable true colors support
set background=dark
let g:ayucolor="mirage" " for mirage version of theme
colorscheme ayu
let g:airline_theme = 'ayu_mirage'

" Powerline fonts
let g:airline_powerline_fonts = 1

" fix garbled powerline characters
set t_RV=

" Syntax highlighting
syntax on

" characters to substitute for invisibles
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣
" enable with:
" set list

" Position in code
set number
set ruler

" Don't make noise
set belloff=all

" default file encoding
set encoding=utf-8

" set esc delay to 0
set ttimeoutlen=10

" Line wrap
" set wrap

" Tabs to spaces, 2 wide tabs
set expandtab
set tabstop=2

" Highlight search results
set hlsearch
set incsearch

" auto + smart indent for code
set autoindent
set smartindent

" Mouse support
set ttyfast " enables fast character redraws
set mouse=a

" Fix kitty background issue
let &t_ut=''

" ALE configuration
let g:ale_fixers = {
  \   'rust': ['rustfmt'],
  \   'python': [],
  \   'go': ['gofmt'],
  \}
let g:ale_fix_on_save = 1

" Keyboard Mapping
map <C-b> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFocus<CR>
noremap <C-n> :tabnew<CR>:NERDTreeToggle<CR>

" move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

