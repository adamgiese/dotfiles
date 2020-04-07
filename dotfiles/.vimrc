" GENERAL SETTINGS
set autoindent
set showmatch
set ruler
set autoread
au CursorHold * checktime
set laststatus=2
set backspace=indent,eol,start
set showmode
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set history=1000
set encoding=utf-8
set noswapfile
set hidden
set number numberwidth=3
set wrap linebreak
set nocompatible
set guifont=Hack
set backupcopy=yes
set path+=/Users/agiese/sites/uar-web/src
color desert  
syntax on


" Highlight Trailing Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Syntax Highlighting

au BufReadPost *.mdx set syntax=markdown

" Use a more efficient escape
inoremap jk <ESC>

" Make Ex commands faster
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" MapToggle Function
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

" Map Function Toggles

MapToggle <F1> spell
MapToggle <F2> paste
MapToggle <F3> number
nnoremap <F5> :UndotreeToggle<cr>
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <F11> :m .+1<CR>==
nnoremap <F12> :m .-2<CR>==
inoremap <F11> <Esc>:m .+1<CR>==gi
inoremap <F12> <Esc>:m .-2<CR>==gi
vnoremap <F11> :m '>+1<CR>gv=gv
vnoremap <F12> :m '<-2<CR>gv=gv

" Vundle Setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'dracula/vim'
Plugin 'mbbill/undotree'
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-sleuth'
Plugin 'junegunn/fzf'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'GabrieleLippi/ydkjs-vim'
Plugin 'kristijanhusak/vim-js-file-import'
Plugin 'ap/vim-css-color'
Plugin 'alvan/vim-closetag'

" closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'elmcast/elm-vim'
call plug#end()

" For matchit
filetype plugin on
:let b:match_words='(:),\[:\],{:},<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(\%(=\|/\)\@<!>\|$\):<\@<=/\1>'
au Filetype css,javascript,jsx
  \ let b:match_words = &matchpairs

" togglling
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <leader>1 :NERDTreeToggle<CR>
Plugin 'kien/ctrlp.vim.git'
let g:ctrlp_working_path_mode = 'ar'
let g:ctrlp_extensions = ['dir']
let g:ctrlp_cmd = 'CtrlP'
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
call vundle#end()            " required
filetype plugin indent on    " required
au BufNewFile,BufRead *.ejs set filetype=html


" supertab settings


let g:SuperTabNoCompleteAfter = ['"', "'", '^', '\s']
