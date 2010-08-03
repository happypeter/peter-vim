"with DiffWithSaved(), I can view the diff between 
"the modified buffer and the original file

"the basic flow of this function is:
"set the current buffer into diff mode, and then read the orignal file into a
"vertical window and set it to diff mode as well, thus the diff of the two is
"available
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
"r # means read the original file
"normal! 1Gdd runs 1Gdd(delete the first line of the current file)
"in normal mode, this seems obscure, but a simple try-out will show what are
"all this about
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
