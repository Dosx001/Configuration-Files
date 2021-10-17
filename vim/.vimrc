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
    autocmd CursorMoved,CursorMovedI * call CenterCursor()
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
highlight StatusLine ctermfg=237 ctermbg=196
highlight WildMenu ctermfg=34 ctermbg=black
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

set spell spelllang=en_us
highlight SpellBad term=reverse ctermfg=black ctermbg=red gui=undercurl guisp=Red
highlight SpellCap term=reverse ctermfg=black ctermbg=blue gui=undercurl guisp=Blue
highlight SpellRare term=reverse ctermfg=black ctermbg=magenta gui=undercurl guisp=Magenta
highlight SpellLocal term=underline ctermfg=black ctermbg=darkcyan gui=undercurl guisp=DarkCyan

hi def Yellow ctermfg=3

let g:currentmode={
            \ 'n' : ['Normal', 'NM'],
            \ 'v' : ['Visual', 'VM'],
            \ 'V' : ['V·Line', 'VM'],
       \ "\<C-V>" : ['V·Block', 'VM'],
            \ 's' : ['Select', 'SM'],
            \ 'S' : ['S·Line', 'SM'],
       \ "\<C-S>" : ['S·Block', 'SM'],
            \ 'R' : ['Replace', 'RM'],
           \ 'Rv' : ['V·Replace', 'RM'],
            \ 'c' : ['Command', 'CM'],
           \ 'ce' : ['Ex', 'OM'],
            \ 'r' : ['Prompt', 'OM'],
           \ 'rm' : ['More', 'OM'],
           \ 'r?' : ['Confirm', 'OM'],
            \ '!' : ['Shell', 'OM'],
            \ 't' : ['Terminal', 'OM']
            \}
hi statusline ctermbg=124 ctermfg=234
hi NM ctermfg=black ctermbg=34
hi IM ctermfg=black ctermbg=124
hi VM ctermfg=black ctermbg=4
hi RM ctermfg=black ctermbg=166
hi SM ctermfg=black ctermbg=154
hi CM ctermfg=black ctermbg=53
hi OM ctermfg=black ctermbg=cyan
hi User1 ctermfg=1 ctermbg=black
hi User2 ctermfg=1 ctermbg=234

let g:int = 0
inoremap <C-X> <Esc>:let g:int = 1<CR>i<C-X>
au InsertChange,InsertLeave,CursorMovedI * let g:int = 0

set laststatus=2
au VimEnter,WinEnter,TabEnter * call StatusLine()
au WinLeave,TabLeave * setlocal statusline=%2*\ %{@%}%m
fun! g:StatusLine()
    setlocal statusline=
    setlocal statusline+=%#IM#%{mode()=='i'?(g:int?'\ \ Completion\ ':'\ \ Insert\ '):''}
    for [key, value] in items(g:currentmode)
        execute "setlocal statusline+=%#" . value[1] . "#%{mode()=='" . key . "'?'\\ \\ " . value[0] . "\\ ':''}"
    endfor
    setlocal statusline+=%1*\ %{GitBranch()}\                 " Git Branch
    setlocal statusline+=%2*\ %{@%}%m\                        " File path
    setlocal statusline+=%=                                   " Right Side
    setlocal statusline+=%2*\ %{&ft}\                         " File type
    setlocal statusline+=%1*\ %{''.(&fenc!=''?&fenc:&enc).''} " Encoding
endfun

fun! g:GitBranch()
    let branch = FugitiveStatusline()
    let [a,m,r] = GitGutterGetHunkSummary()
    return !empty(branch) ? "+" . a . " ~" . m . " -" . r . " " . branch[5:-3] : ""
endfun

call plug#begin('~/.vim/plugged')
Plug 'Dosx001/tabline.vim'
Plug 'Dosx001/vim-indentguides'
Plug 'Dosx001/vim-template'
Plug 'Dosx001/vim-rainbow'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'jaxbot/browserlink.vim'
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

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
