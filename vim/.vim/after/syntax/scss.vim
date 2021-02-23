runtime! syntax/css.vim
syn case ignore

set iskeyword+=@-@,+,-,*,/,=,!

syn keyword scssKeys @mixin @use @include @extend
hi link scssKeys Title
syn keyword scssOp @if @elif @else @for @while null + - * / = == !=
hi link scssOp Statement
syn match inheritance "%\a\+[[:alnum"]-_]*"
hi link inheritance Title
syn match var "\$\a\+[[:alnium:]-_]*"
hi link var Identifier
syn match function "\w\+\s*(\@="
hi link function Identifier

syn region scss matchgroup=Braces start='{' end='}' contains=scss,scssKeys,scssOp,inheritance,function,var
hi link Braces Identifier
