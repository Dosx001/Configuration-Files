setlocal syn=css
set iskeyword+=@-@,+,-,*,/,=,!

syn keyword scssKeys @mixin @use @include @extend
hi link scssKeys Title
syn keyword scssOp @if @elif @else @for @while null + - * / = == !=
hi link scssOp Statement
syn match inheritance "%\a\+[a-zA-z0-9]*"
hi link inheritance Title
syn match var "\$\a\+[a-zA-z0-9\-]*"
hi link var Identifier
syn match function "\w\+\s*(\@="
hi link function Identifier

syn region scss matchgroup=Braces start='{' end='}' contains=scss,scssKeys,scssOp,inheritance,function,var
hi link Braces Identifier
