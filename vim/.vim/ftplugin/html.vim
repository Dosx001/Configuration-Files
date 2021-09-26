setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab
setlocal smartindent

inoremap > ><C-g>u
nnoremap <C-l> $:call emmet#expandAbbr(3,"")<CR>
inoremap <C-l> <Esc>$:call emmet#expandAbbr(3,"")<CR>
nnoremap <C-k> ihtml:5
