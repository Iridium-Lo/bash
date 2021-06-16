execute pathogen#infect()

syntax on 

set ai
set ruler
set number
set hlsearch
set t_Co=256
set showmode
set showmatch
set encoding=utf-8 
set background=dark

colorscheme onedark 

let g:tagbar_width=25
let g:NERDTreeWinSize=13

highlight LineNr ctermfg=magenta

autocmd vimenter * Tagbar
autocmd vimenter * NERDTree

autocmd vimleave * TagbarClose
autocmd vimleave * NERDTreeClose 
autocmd vimleave *  exit 
