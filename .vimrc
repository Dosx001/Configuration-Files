set number
set smartindent
set expandtab shiftwidth=4 tabstop=4 softtabstop=4
syntax on
"colorscheme monokai
set wildmenu
set path+=**
set incsearch
set smartcase
set colorcolumn=125
highlight ColorColumn ctermbg=darkgrey
set noswapfile
set nobackup
set nowrap
set hidden
set cursorline
highlight CursorLine cterm=NONE ctermbg=17
highlight CursorLineNR cterm=None ctermbg=white
"set cursorcolumn
"highlight CursorColumn cterm=None ctermbg=17
highlight LineNr ctermfg=darkred ctermbg=237 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE
set signcolumn=yes
highlight SignColumn ctermbg=None
highlight VertSplit ctermbg=darkred ctermfg=237
set listchars=tab:>-
highlight TabLineFill ctermfg=237 ctermbg=DarkGreen
highlight TabLine ctermfg=darkred ctermbg=237 cterm=None
highlight TabLineSel ctermfg=196 ctermbg=None
highlight StatusLine ctermfg=white ctermbg=241 cterm=bold
set encoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerlin
set updatetime=100
set equalalways
autocmd VimResized * wincmd = 

" Key Mapping
"inoremap <C-q> <Esc>
"vnoremap <C-q> <Esc>
"cnoremap <C-q> <Esc>
"inoremap \" \""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>

call plug#begin('~/.vim/plugged')
"Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/frazrepo/vim-rainbow.git'
Plug 'vim-airline/vim-airline'
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
call plug#end()

" YouCompleteMe
let g:ycm_filetype_specific_completion_to_disable = {'*': 1}

" Rainbow
let g:rainbow_active = 1

" Git Gutter
highlight GitGutterAdd ctermfg=green ctermbg=237
highlight GitGutterChange ctermfg=226 ctermbg=237
highlight GitGutterDelete ctermfg=darkred ctermbg=237
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_removed = '-'
nmap ] <Plug>(GitGutterNextHunk)
nmap [ <Plug>(GitGutterPrevHunk)

" Airline
"let g:airline_powerline_fonts = 1
"let g:Powerline_symbols='unicode'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" indentLine
let g:indentLine_char = '|'
let g:indentLine_color_term = 237 
