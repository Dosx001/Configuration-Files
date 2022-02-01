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
set guicursor=a:ver25-blinkon0

augroup Start
  au!
  au VimResized * wincmd =
  au FileType json set filetype=jsonc
  au BufWinLeave <buffer> call clearmatches()
  au FileType help autocmd BufWinEnter <buffer=abuf> setlocal number relativenumber signcolumn=no
  au CursorMoved,CursorMovedI * call CenterCursor()
augroup END

fun! g:CenterCursor()
  let i = line('$') - line('.')
  if i < 30
    execute "set scrolloff=" . i
  else
    set scrolloff=999
  endif
endfun

com Py execute "wa | !clear; python3 '%:t'"
com Sass execute "wa | !clear; sass '%:t' > '%:t:r'.css"
com Restore execute "!git restore '%:p'"
com Source execute "w | source ~/.config/nvim/init.vim"
com Clear execute "!clear"

set timeoutlen=5000
map <Space> <leader>
map <leader>i ^
map <leader>a $
map <leader>c i<C-x>s
map <leader>C :setlocal spell!<CR>
map <leader><C-c> zg
map <leader>v :vnew<CR>\z
map <leader>V <C-w>v
map <leader>s :new<CR>\z
map <leader>S <C-w>s
map <leader>t :tabe<CR>\z
map <leader>m :tab h 
map <leader>M :vert h 
map <leader>q <C-w>q
map <leader>Q :quitall<CR>
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
map <leader>, q:<Up>
map <leader>. :<Up><CR>
map <leader>> :<Up>
map <leader>/ :noh<CR>
map <leader>0 :Source<CR>
"nno <Tab> gt
"nno <S-Tab> gT
nno Y y$
cno <A-k> <Up>
cno <A-j> <Down>
cno <A-h> <Left>
cno <A-l> <Right>
ino <C-v> <Esc>pi
ino <C-c> <C-x>s
ino <C-f> <C-x><C-f>
ino <C-h> <C-x><C-k>
ino <expr><Esc> col('.') == 1 ? "\<Esc>" : "\<Esc>l"
nno <F1> :PlugClean<CR>
nno <F2> :PlugInstall<CR>
nno <F3> :PlugUpdate<CR>
nno <F4> :PlugUpgrade<CR>
nno <F5> :!<CR><CR>
ino <F5> <Esc>:!<CR><CR>
nno <F12> :vnew \| vnew \| wincmd l<CR><C-W><C-X>
nno <C-p> $p
nno <C-s> :w<CR>
ino <C-s> <Esc>:w<CR>
nno <C-q> :wa<CR>
ino <C-q> <Esc>:wa<CR>
ino . .<C-g>u
ino <Space> <Space><C-g>u
nno <C-k> :call CtrlK()<CR>
ino <C-k> <Esc>:call CtrlK()<CR>

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

hi Normal guifg=darkgray guibg=#000000
hi Comment term=bold ctermfg=4 guifg=#0037da
hi Constant term=underline ctermfg=1 guifg=#b30000
hi Special term=bold ctermfg=5 guifg=#881798
hi Identifier term=underline ctermfg=6 guifg=#3a96dd
hi Statement term=bold ctermfg=130 gui=bold guifg=#af5f00
hi PreProc term=underline ctermfg=5 guifg=#b3b300
hi Type term=underline ctermfg=2 gui=bold guifg=#13a10e
hi Underlined term=underline cterm=underline ctermfg=5 gui=underline guifg=#881798

hi Visual ctermbg=235 guibg=#242424
hi VertSplit ctermfg=237 ctermbg=darkred guibg=#b30000 guifg=#363636
hi EndOfBuffer ctermfg=237 ctermbg=None guifg=#363636 guibg=None
hi Pmenu ctermfg=1 ctermbg=black guifg=#b30000 guibg=#0c0c0c
hi PmenuSel ctermfg=208 ctermbg=8 guifg=#ef7f00 guibg=#3c3c3c
hi PmenuSbar ctermbg=248 guibg=Grey
hi PmenuThumb ctermbg=0 guibg=DarkRed
hi MsgArea guifg=#efefef
hi IncSearch term=reverse cterm=reverse gui=reverse
hi Search term=reverse cterm=reverse gui=reverse guifg=None guibg=None

hi DiffAdd term=bold ctermbg=22 guifg=black guibg=#005f00
hi DiffChange term=bold ctermbg=3 guifg=black guibg=#c19c00
hi DiffDelete term=bold ctermbg=88 guifg=black guibg=#870000
hi DiffText term=reverse cterm=bold ctermbg=53 gui=bold guifg=black guibg=#5f005f

set wildmenu
"hi WildMenu ctermfg=34 ctermbg=black
hi StatusLine ctermfg=237 ctermbg=196 guifg=#ef0000 guibg=#363636
hi StatusLineNC ctermfg=237 ctermbg=196 guifg=#ef0000 guibg=#363636

set showtabline=2
hi TabLine ctermfg=darkred ctermbg=234 cterm=None guifg=#b30000 guibg=#1a1a1a
hi TabLineSel ctermfg=196 ctermbg=None guifg=#ef0000 guibg=None
hi TabLineFill ctermfg=233 guifg=#111111

set number relativenumber
hi LineNr ctermfg=darkred ctermbg=234 guifg=#b30000 guibg=#1a1a1a

set colorcolumn=100
hi ColorColumn ctermbg=235 guibg=#242424

set cursorline
hi CursorLine cterm=NONE ctermbg=235 guibg=#242424
hi CursorLineNR cterm=None ctermbg=7 guifg=#a45900 guibg=#b3b3b3

"set cursorcolumn
"hi CursorColumn cterm=None ctermbg=17

set signcolumn=yes
hi SignColumn ctermbg=NONE guibg=NONE

set listchars=tab:┆\ ,trail:•,extends:>,precedes:<,nbsp:~ ",eol:π
hi SpecialKey ctermfg=darkred guifg=#b30000
hi NoneText ctermfg=darkred ctermbg=237 cterm=bold guifg=#b30000 guibg=#363636
hi ExtendsChar ctermfg=darkred ctermbg=237 cterm=bold guifg=#b30000 guibg=#363636
hi PrecedesChar ctermfg=darkred ctermbg=237 cterm=bold guifg=#b30000 guibg=#363636
hi TrailChar ctermfg=darkred ctermbg=237 cterm=bold guifg=#b30000 guibg=#363636

set spelllang=en_us
hi SpellBad term=reverse ctermfg=black ctermbg=red guifg=#000000 guibg=#e74856
hi SpellCap term=reverse ctermfg=black ctermbg=blue guifg=#000000 guibg=#3b78ff
hi SpellRare term=reverse ctermfg=black ctermbg=magenta guifg=#000000 guibg=#b4009e
hi SpellLocal term=underline ctermfg=black ctermbg=darkcyan guifg=#000000 guibg=#3a96dd

call plug#begin('~/.nvim')
" My Suff
Plug 'Dosx001/statusline.vim'
Plug 'Dosx001/tabline.vim'
Plug 'Dosx001/vim-lazy'
Plug 'Dosx001/vim-template'
" Vim
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Nvim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'neovim/nvim-lspconfig'
Plug 'weilbith/nvim-code-action-menu'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lewis6991/gitsigns.nvim'
" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" fzf
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

lua require("init")

" Markdown Preview
let g:mkdp_open_ip = 'localhost'

" Git Signs
hi GitSignsAdd ctermfg=green ctermbg=235 guifg=#3cef3c guibg=#242424
hi GitSignsChange ctermfg=226 ctermbg=235 guifg=#efef00 guibg=#242424
hi GitSignsDelete ctermfg=darkred ctermbg=235 guifg=#b30000 guibg=#242424
hi GitSignsChangeDelete ctermfg=202 ctermbg=235 guifg=#ef5900 guibg=#242424
nmap <A-]> <cmd>Gitsigns next_hunk<CR>
nmap <A-[> <cmd>Gitsigns prev_hunk<CR>
map <leader>g <cmd>Gitsigns preview_hunk<CR>

" Nvim TS Rainbow
hi IndentBlanklineIndent1 guifg=darkred gui=nocombine
hi IndentBlanklineIndent2 guifg=#974300 gui=nocombine
hi IndentBlanklineIndent3 guifg=#828200 gui=nocombine
hi IndentBlanklineIndent4 guifg=darkgreen gui=nocombine
hi IndentBlanklineIndent5 guifg=darkcyan gui=nocombine
hi IndentBlanklineIndent6 guifg=darkblue gui=nocombine
hi IndentBlanklineIndent7 guifg=darkmagenta gui=nocombine

" Nvim Complation
set completeopt=menu,menuone,noselect
map <leader>n <cmd>lua vim.diagnostic.goto_next()<CR>
map <leader>p <cmd>lua vim.diagnostic.goto_prev()<CR>
map <leader>f <cmd>CodeActionMenu<CR>
map <leader>F <cmd>lua vim.diagnostic.open_float()<CR>
map <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
map <leader>d <cmd>lua vim.lsp.buf.definition()<CR>
map <leader>D <cmd>lua vim.lsp.buf.declaration()<CR>
map <leader>e <cmd>lua vim.lsp.buf.formatting_sync()<CR>

" Telescope
nnoremap <leader>zf <cmd>Telescope find_files<cr>
nnoremap <leader>zg <cmd>Telescope live_grep<cr>
nnoremap <leader>zb <cmd>Telescope buffers<cr>
nnoremap <leader>zh <cmd>Telescope help_tags<cr>
nnoremap <leader>ze :e 
