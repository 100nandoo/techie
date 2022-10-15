:filetype plugin on
:syntax on
:set mouse=a
:set number
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
set guiheadroom=0
