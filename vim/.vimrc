filetype plugin on
filetype plugin indent on

set smartindent
set expandtab shiftwidth=2 tabstop=2 softtabstop=2
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
set backupcopy=yes

augroup Start
  autocmd!
  autocmd VimResized * wincmd =
  autocmd BufWinLeave <buffer> call clearmatches()
  autocmd BufRead * if expand('%:e') == "ps1" | setlocal syntax=ps1.vim | endif
  autocmd FileType help autocmd BufWinEnter <buffer=abuf> setlocal number relativenumber signcolumn=no
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

set timeoutlen=5000
map <Space> <leader>
map <leader>i ^
map <leader>a $
map <leader>c i<C-x>s
map <leader>C :setlocal spell!<CR>
map <leader><C-c> zg
map <leader>v :vs 
map <leader>V <C-w>v
map <leader>s :sp 
map <leader>S <C-w>s
map <leader>t :tabe 
map <leader>m :tab h 
map <leader>M :vert h 
map <leader>q <C-w>q
map <leader>Q :q!<CR>
map <leader>W :setlocal wrap!<CR>
map <leader>w <C-w>w
map <leader>x <C-w>x
map <leader>h <C-w>h
map <leader>H <C-w>H
map <leader>j <C-w>j
map <leader>J <C-w>J
map <leader>k <C-w>k
map <leader>K <C-w>K
map <leader>l <C-w>l
map <leader>L <C-w>L
map <leader>r :,s/
map <leader>R :,+
map <leader><C-r> :%s/
map <leader>u :earlier 1f<CR>
map <leader>U :earlier 
map <leader>. :<Up><CR>
map <leader>> :<Up>
map <leader>, q:<Up>
map <leader>0 :Source<CR>
nnoremap Y y$
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
inoremap <C-v> <Esc>pi
inoremap <C-c> <C-x>s
inoremap <C-f> <C-x><C-f>
inoremap <C-h> <C-x><C-k>
inoremap <Esc> <Esc>l
nnoremap <F1> :PlugClean<CR>
nnoremap <F2> :PlugInstall<CR>
nnoremap <F3> :PlugUpdate<CR>
nnoremap <F2> :PlugUpgrade<CR>
nnoremap <F5> :!<CR><CR>
inoremap <F5> <Esc>:!<CR><CR>
nnoremap <F12> :vnew \| vnew \| wincmd l<CR><C-W><C-X>
nnoremap <C-p> $p
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :wa<CR>
inoremap <C-q> <Esc>:wa<CR>
inoremap . .<C-g>u
inoremap <Space> <Space><C-g>u
nnoremap <C-k> :call CtrlK()<CR>
inoremap <C-k> <Esc>:call CtrlK()<CR>

fun! g:CtrlK()
  let ft = expand('%:e')
  if ft == "py"
    execute "Py"
  elseif ft =~ 'html\|jsx\|tsx'
    call cursor(line('.'), len(getline('.')))
    call emmet#expandAbbr(3,"")
  elseif ft == "ts"
    execute "wa | !clear; tsc"
  endif
endfun

syntax on
highlight Visual ctermbg=235
highlight VertSplit ctermbg=darkred ctermfg=237
highlight EndOfBuffer ctermfg=237 ctermbg=None
highlight Pmenu ctermfg=1 ctermbg=black
highlight PmenuSel ctermfg=208 ctermbg=8

hi DiffAdd term=bold ctermbg=22 guibg=LightBlue
hi DiffChange term=bold ctermbg=3 guibg=LightMagenta
hi DiffDelete term=bold ctermbg=88 gui=bold guifg=Blue guibg=LightCyan
hi DiffText term=reverse cterm=bold ctermbg=53 gui=bold guibg=Red

set wildmenu
hi WildMenu ctermfg=34 ctermbg=black
hi StatusLine ctermfg=236 ctermbg=196
hi StatusLineNC ctermfg=236 ctermbg=196

set showtabline=2
highlight TabLine ctermfg=darkred ctermbg=234 cterm=None
highlight TabLineSel ctermfg=196 ctermbg=None
highlight TabLineFill ctermfg=233

set number relativenumber
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

set list listchars=tab:┆\ ,trail:•,extends:>,precedes:<,nbsp:~ ",eol:π
highlight SpecialKey ctermfg=darkred
highlight NoneText ctermfg=darkred ctermbg=237 cterm=bold
highlight ExtendsChar ctermfg=darkred ctermbg=237 cterm=bold
highlight PrecedesChar ctermfg=darkred ctermbg=237 cterm=bold
highlight TrailChar ctermfg=darkred ctermbg=237 cterm=bold

set spelllang=en_us
highlight SpellBad term=reverse ctermfg=black ctermbg=red gui=undercurl guisp=Red
highlight SpellCap term=reverse ctermfg=black ctermbg=blue gui=undercurl guisp=Blue
highlight SpellRare term=reverse ctermfg=black ctermbg=magenta gui=undercurl guisp=Magenta
highlight SpellLocal term=underline ctermfg=black ctermbg=darkcyan gui=undercurl guisp=DarkCyan

hi def Yellow ctermfg=3

call plug#begin('~/.vim/plugged')
Plug 'Dosx001/statusline.vim'
Plug 'Dosx001/tabline.vim'
Plug 'Yggdroot/indentLine'
Plug 'Dosx001/vim-lazy'
Plug 'Dosx001/vim-template'
Plug 'Dosx001/vim-rainbow'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ycm-core/YouCompleteMe'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
call plug#end()

" Git Gutter
highlight GitGutterAdd ctermfg=green ctermbg=235
highlight GitGutterChange ctermfg=226 ctermbg=235
highlight GitGutterDelete ctermfg=darkred ctermbg=235
highlight GitGutterChangeDelete ctermfg=202 ctermbg=235
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_removed = '−'
let g:gitgutter_sign_modified_removed = "~-"
let g:gitgutter_sign_removed_above_and_below = '='
nmap <leader>] <Plug>(GitGutterNextHunk)
nmap <leader>[ <Plug>(GitGutterPrevHunk)

" Indent Lines
let g:indentLine_char_list = ['▏','|', '¦', '┆', '┊']
let g:indentLine_color_term = 237

" Markdown Preview
let g:mkdp_open_ip = 'localhost'

" Rainbow
let g:rainbow_blocklist = ['css', 'html', 'scss', 'jsx' , 'tsx' ]
"let g:rainbow_ctermfgs = [196, 208, 226, 46, 51, 21, 93, 202] "rainbow colors
let g:rainbow_ctermfgs = ['brown', 'Darkblue', 'darkgray', 'darkgreen',
      \'darkcyan', 'darkred', 'darkmagenta', 'brown', 'gray',
      \'darkmagenta', 'Darkblue', 'darkgreen', 'darkcyan', 'darkred', 'red']

" YouCompleteMe
"let g:ycm_filetype_specific_completion_to_disable = {'*': 1}
set completeopt-=preview
let g:ycm_always_populate_location_list = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_hover = ""
"let g:ycm_max_num_candidates = 10
map <leader>n :lnext<CR>
map <leader>p :lprevious<CR>
map <leader>f :YcmCompleter FixIt<CR>
