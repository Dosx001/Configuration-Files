syn match func /\a[-_a-zA-Z0-9]*(/me=e-1
hi link func Function
syn match dots "[a-zA-Z0-9]\(\.\a[-_a-zA-Z0-9]*\)\+"hs=s+1
hi link dots Type
syn keyword Statement body localStorage JSON Math then console log
