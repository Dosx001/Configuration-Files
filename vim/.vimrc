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
set guifont=Ubuntu\ Mono\ derivative\ Powerlin
set updatetime=100
set equalalways
set autoread
set showcmd
set noshowmode

"function! InsertStatuslineColor(mode)
"    let modes = {'n': 'Normal ', 'i': 'Insert ', 'R': 'Replace ', 'v': 'Visual ', 'V': 'V-Line ', "\<C-v>": 'V-Block '}
"    return  get(modes, a:mode, 'New ')
"endfunction
"
"function! GitStatus()
"    let l:branch = system("git branch --show-current 2> /dev/null | tr -d '\n'")
"    if l:branch != ""
"        let l:branch .= " "
"        let l:branch .= join(map(['+','~','-'], {i,v -> v.''.GitGutterGetHunkSummary()[i]}), ' ')
"        return l:branch
"    endif
"    return ""
"endfunction
"set statusline=%{InsertStatuslineColor(mode())}
"set statusline+=%{GitStatus()}

augroup UPDATE_GITBRANCH
  " clear old commands
  autocmd!

  " update git branch
  autocmd BufWritePre * :call UpdateGitBranch()
  autocmd BufReadPost * :call UpdateGitBranch()
  autocmd BufEnter * :call UpdateGitBranch()
augroup END
let b:gitparsedbranchname = ''
function! UpdateGitBranch()
  let l:string = system("git branch --show-current 2>/dev/null | tr -d '\n'")
  let b:gitparsedbranchname = strlen(l:string) > 0?''.l:string.'':' '
endfunction

set laststatus=2
set statusline=%{b:gitparsedbranchname}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

autocmd VimResized * wincmd =
autocmd BufWinLeave <buffer> call clearmatches()
autocmd BufRead,BufNewFile * if expand('%:e') == "ps1" | setlocal syntax=ps1.vim | endif

command Py execute "wa | !clear; python3 '%:t'"
command Sass execute "wa | !clear; sass '%:t' > '%:t:r'.css"
command Restore execute "!git restore '%:p'"
command Source execute "w | source %"
command Clear execute "!clear"

" Key Mapping
"inoremap <C-q> <Esc>
"vnoremap <C-q> <Esc>
"cnoremap <C-q> <Esc>
"inoremap \" \""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>

syntax on
"colorscheme monokai
highlight Visual ctermbg=235
highlight TabLine ctermfg=darkred ctermbg=234 cterm=None
highlight TabLineSel ctermfg=196 ctermbg=None
highlight TabLineFill ctermfg=237 ctermbg=DarkGreen
highlight StatusLine ctermfg=white ctermbg=241 cterm=bold
highlight VertSplit ctermbg=darkred ctermfg=237
highlight EndOfBuffer ctermfg=237 ctermbg=None

set number
highlight LineNr ctermfg=darkred ctermbg=black

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

"set showbreak=\\ " [bonus]
"highlight ExtraWhitespace ctermfg=blue ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$\|\t/
"highlight RedundantSpaces ctermbg=darkred guibg=red
"match RedundantSpaces /\s\+$/
"autocmd BufWinEnter <buffer> match Error /\s\+$/
"autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
"autocmd InsertLeave <buffer> match Error /\s\+$/
"highlight Cursor ctermfg=red ctermbg=blue guifg=red guibg=black
"highlight iCursor ctermfg=green ctermbg=yellow guifg=green guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'Dosx001/tabline.vim'
Plug 'Dosx001/vim-indentguides'
Plug 'airblade/vim-gitgutter'
Plug 'frazrepo/vim-rainbow'
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
"Plug 'Yggdroot/indentLine.git'
"Plug 'ycm-core/YouCompleteMe.git'
"Plug 'jaxbot/browserlink.vim'
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

" YouCompleteMe
"let g:ycm_filetype_specific_completion_to_disable = {'*': 1}

" Rainbow
autocmd FileType c,cpp,python,javascript,java,json,typescript call rainbow#load()
"let g:rainbow_ctermfgs = [196, 208, 226, 46, 51, 21, 93, 202] "rainbow colors
let g:rainbow_ctermfgs = ['brown', 'Darkblue', 'darkgray', 'darkgreen',
            \'darkcyan', 'darkred', 'darkmagenta', 'brown', 'gray',
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
"let g:airline_powerline_fonts = 1
"let g:airline_extensions = []
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

" Emmet
"let g:user_emmet_leader_key='<Ctrl-q>'
"let g:user_emmet_mode='a'
