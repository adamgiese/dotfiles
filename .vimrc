" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

set termguicolors
silent! colorscheme dracula

" Display
set number
set relativenumber
set cursorline
set scrolloff=8
set wrap
set linebreak

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Behavior
set backspace=indent,eol,start
set hidden
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo
set mouse=a
set clipboard=unnamed

" Appearance
set laststatus=2
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set statusline=%f\ %m%r%=%l/%L\ col\ %c

highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/

syntax enable
filetype plugin indent on

" Keymaps
nnoremap ; :
nnoremap : ;
