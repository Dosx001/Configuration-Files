setlocal syn=css

syn match mixin "@mixin"
hi link mixin Title
syn match use "@use"
hi link use Title
syn match include "@include"
hi link include Title
syn match extend "@extend"
hi link extend Title
syn match inheritance "%\{1\}[a-zA-Z]\+[a-zA-z0-9]*"
hi link inheritance Title
syn match var "\$[a-zA-Z]\+[a-zA-z0-9]*"
hi link var Identifier
syn match function "\w\+\s*(\@="
hi link function Identifier
