set number
set smartindent
set expandtab shiftwidth=4 tabstop=4 softtabstop=4
filetype plugin on
filetype plugin indent on
syntax on
"colorscheme monokai
set wildmenu
set path+=**
set complete-=i
set incsearch
set smartcase
set colorcolumn=100
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
highlight SignColumn ctermbg=NONE
highlight VertSplit ctermbg=darkred ctermfg=237
highlight TabLineFill ctermfg=237 ctermbg=DarkGreen
highlight TabLine ctermfg=darkred ctermbg=234 cterm=None
highlight TabLineSel ctermfg=196 ctermbg=None
highlight StatusLine ctermfg=white ctermbg=241 cterm=bold
highlight EndOfBuffer ctermfg=237 ctermbg=None
set encoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerlin
set updatetime=100
set equalalways
autocmd VimResized * wincmd =
set listchars=tab:┆\ ,trail:•,extends:>,precedes:<,nbsp:~ ",eol:π
highlight SpecialKey ctermfg=darkred
highlight NoneText ctermfg=darkred ctermbg=237 cterm=bold
highlight ExtendsChar ctermfg=darkred ctermbg=237 cterm=bold
highlight PrecedesChar ctermfg=darkred ctermbg=237 cterm=bold
highlight TrailChar ctermfg=darkred ctermbg=237 cterm=bold
"set showbreak=\\ " [bonus]
"highlight ExtraWhitespace ctermfg=blue ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$\|\t/
"highlight RedundantSpaces ctermbg=darkred guibg=red
"match RedundantSpaces /\s\+$/
"autocmd BufWinEnter <buffer> match Error /\s\+$/
"autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
"autocmd InsertLeave <buffer> match Error /\s\+$/
autocmd BufWinLeave <buffer> call clearmatches()
highlight Visual ctermbg=235
"highlight Cursor ctermfg=red ctermbg=blue guifg=red guibg=black
"highlight iCursor ctermfg=green ctermbg=yellow guifg=green guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

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
"Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/thaerkh/vim-indentguides.git'
Plug 'https://github.com/mkitt/tabline.vim.git'
call plug#end()

" YouCompleteMe
"let g:ycm_filetype_specific_completion_to_disable = {'*': 1}

" Rainbow
autocmd FileType c,cpp,python,javascript,java,json call rainbow#load()
"let g:rainbow_ctermfgs = [196, 208, 226, 46, 51, 21, 93, 202] "rainbow colors
let g:rainbow_ctermfgs = ['brown', 'Darkblue', 'darkgray', 'darkgreen',
            \'darkcyan', 'darkred', 'darkmagenta', 'brown', 'gray', 184,
            \'darkmagenta', 'Darkblue', 'darkgreen', 'darkcyan', 'darkred', 'red']

" Git Gutter
highlight GitGutterAdd ctermfg=green ctermbg=237
highlight GitGutterChange ctermfg=226 ctermbg=237
highlight GitGutterDelete ctermfg=darkred ctermbg=237
highlight GitGutterChangeDelete ctermfg=202 ctermbg=237
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_removed = '−'
let g:gitgutter_sign_modified_removed = "~-"
nmap ] <Plug>(GitGutterNextHunk)
nmap [ <Plug>(GitGutterPrevHunk)

" Airline
"let g:airline_extensions = []
"let g:airline_powerline_fonts = 1
"let g:Powerline_symbols='unicode'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" indentLine
"let g:indentLine_enabled = 0
"let g:indentLine_char = '|'
"let g:indentLine_color_term = 237

" Indent Guides
let g:indentguides_spacechar = '|'
let g:indentguides_tabchar = '┆'
