filetype plugin on
filetype plugin indent on

set smartindent
set expandtab shiftwidth=4 tabstop=4 softtabstop=4
set wildmenu
set path+=**
set complete-=i
set incsearch
set smartcase
set noswapfile
set nobackup
set nowrap
set hidden
set encoding=utf-8
set updatetime=100
set equalalways
set autoread
set showcmd
set noshowmode

augroup Start
    autocmd VimResized * wincmd =
    autocmd BufWinLeave <buffer> call clearmatches()
    autocmd BufRead * if expand('%:e') == "ps1" | setlocal syntax=ps1.vim | endif
    autocmd CursorMoved * call CenterCursor()
    autocmd CursorMovedI * call CenterCursor()
augroup END

fun! g:CenterCursor()
    let i = line('$') - line('.')
    if i < 30
        execute "set scrolloff=" . i
    else
        set scrolloff=999
    endif
endfun

command Py execute "wa | !clear; python3 '%:t'"
command Sass execute "wa | !clear; sass '%:t' > '%:t:r'.css"
command Restore execute "!git restore '%:p'"
command Source execute "w | source %"
command Clear execute "!clear"

nnoremap <F2> :%s/
inoremap <F2> <Esc>:%s/
nnoremap <F3> :vs 
inoremap <F3> <Esc>:vs 
nnoremap <F4> :tabe 
inoremap <F4> <Esc>:tabe 
nnoremap <F5> :!<CR><CR>
inoremap <F5> <Esc>:!<CR><CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :wa<CR>
inoremap <C-q> <Esc>:wa<CR>
inoremap . .<C-g>u
inoremap <Space> <Space><C-g>u
nnoremap <C-k> :call CtrlK()<CR>
inoremap <C-k> <Esc>:call CtrlK()<CR>

fun! g:CtrlK()
    let filetype = expand('%:e')
    if filetype == "py"
        execute "Py"
    elseif filetype == "html"
        call cursor(line('.'), len(getline('.')))
        call emmet#expandAbbr(3,"")
    endif
endfun

syntax on
highlight Visual ctermbg=235
highlight TabLine ctermfg=darkred ctermbg=234 cterm=None
highlight TabLineSel ctermfg=196 ctermbg=None
highlight TabLineFill ctermfg=237 ctermbg=DarkGreen
highlight StatusLine ctermfg=white ctermbg=241 cterm=bold
highlight VertSplit ctermbg=darkred ctermfg=237
highlight EndOfBuffer ctermfg=237 ctermbg=None
highlight Pmenu ctermfg=1 ctermbg=black
highlight PmenuSel ctermfg=208 ctermbg=8

set number
highlight LineNr ctermfg=darkred ctermbg=234

set colorcolumn=100
highlight ColorColumn ctermbg=235

set cursorline
highlight CursorLine cterm=NONE ctermbg=235
highlight CursorLineNR cterm=None ctermbg=7

"set cursorcolumn
"highlight CursorColumn cterm=None ctermbg=17

set signcolumn=yes
highlight SignColumn ctermbg=NONE

set listchars=tab:┆\ ,trail:•,extends:>,precedes:<,nbsp:~ ",eol:π
highlight SpecialKey ctermfg=darkred
highlight NoneText ctermfg=darkred ctermbg=237 cterm=bold
highlight ExtendsChar ctermfg=darkred ctermbg=237 cterm=bold
highlight PrecedesChar ctermfg=darkred ctermbg=237 cterm=bold
highlight TrailChar ctermfg=darkred ctermbg=237 cterm=bold

hi def Yellow ctermfg=3

call plug#begin('~/.vim/plugged')
Plug 'Dosx001/tabline.vim'
Plug 'Dosx001/vim-indentguides'
Plug 'Dosx001/vim-template'
Plug 'Dosx001/vim-rainbow'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'jaxbot/browserlink.vim'
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='jet'

" Git Gutter
highlight GitGutterAdd ctermfg=green ctermbg=237
highlight GitGutterChange ctermfg=226 ctermbg=237
highlight GitGutterDelete ctermfg=darkred ctermbg=237
highlight GitGutterChangeDelete ctermfg=202 ctermbg=237
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_removed = '−'
let g:gitgutter_sign_modified_removed = "~-"
nmap <F10> <Plug>(GitGutterNextHunk)
nmap <F9> <Plug>(GitGutterPrevHunk)

" Indent Guides
let g:indentguides_spacechar = '|'
let g:indentguides_tabchar = '┆'

" Rainbow
let g:rainbow_blacklist = ['css', 'html', 'scss']
"let g:rainbow_ctermfgs = [196, 208, 226, 46, 51, 21, 93, 202] "rainbow colors
let g:rainbow_ctermfgs = ['brown', 'Darkblue', 'darkgray', 'darkgreen',
            \'darkcyan', 'darkred', 'darkmagenta', 'brown', 'gray',
            \'darkmagenta', 'Darkblue', 'darkgreen', 'darkcyan', 'darkred', 'red']

" YouCompleteMe
"let g:ycm_filetype_specific_completion_to_disable = {'*': 1}
"set completeopt-=preview
"let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_max_num_candidates = 10
