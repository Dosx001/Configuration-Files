syn keyword Statement cin cout std
syn match func /\a[-_a-zA-Z0-9]*(/me=e-1
hi link func Function
syn match dots "[a-zA-Z0-9]\(\.\a[-_a-zA-Z0-9]*\)\+"hs=s+1
hi link dots Type
syn match class_func /\a[-_a-zA-Z0-9]*::/me=e-2
syn match class / \a[-_a-zA-Z0-9]* {/me=e-1
hi link class_func Yellow
hi link class Yellow
