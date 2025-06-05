" sleezwave.nvim colorscheme
" Traditional vim colorscheme file

if exists("g:loaded_sleezwave")
  finish
endif
let g:loaded_sleezwave = 1

lua << EOF
require('sleezwave').load()
EOF
