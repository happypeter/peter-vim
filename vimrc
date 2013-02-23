"""""""""""""""""""""""""""""""""""""""""
"
"       rails.vim
"
""""""""""""""""""""""""""""""""""""""""
  " I don't use Rcontroller... stuff a lot
  " cause I have fuzzyfinder, but rails.vim provide me `gf` for rails
  " which is sth I miss.

""""""""""""""""""""""""""""""""""""""""
"
"       for Mac
"
""""""""""""""""""""""""""""""""""""""""

  " vim run in Mac terminal, does not have syntax highlighting without this
  syntax on

""""""""""""""""""""""""""""""""""""""""
"
"             pathogen
"
""""""""""""""""""""""""""""""""""""""""

  call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""
"
"             ack
"
""""""""""""""""""""""""""""""""""""""""
  
  " sudo apt-get install ack-grep, on ubuntu box
  map ,k :Ack <cword><ENTER>


""""""""""""""""""""""""""""""""""""""""
"
"             EOL whitespace
"
""""""""""""""""""""""""""""""""""""""""
  
  " now if you have spaces at end of lines, you get notified
  set list
  set listchars=trail:+

""""""""""""""""""""""""""""""""""""""""
"
"             fuzzfinder
"
""""""""""""""""""""""""""""""""""""""""

  map ,,  :FufCoverageFile!<cr>
  " exclude is very dangerous, cause once you exclude sth, you can not add it in
  " FufAddPath(), 
  " for example if I exclude "tmp" here, I can not add anything with "tmp" as
  " its path, like "hello.tmp/", "/home/peter/tmp/**/*"
  " better to use g:fuf_coveragefile_globPatterns
  let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|db/migrate)'
  let g:fuf_enumeratingLimit = 500
  let g:fuf_coveragefile_prompt = '=>'

  function! FufAddPath(newpath)
    call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', g:fuf_coveragefile_globPatterns + [a:newpath]])
  endfunction
  "" e.g :call FufAddPath('/home/peter/xxx/ideas/**/*')

""""""""""""""""""""""""""""""""""""""""
"
"             paste
"
""""""""""""""""""""""""""""""""""""""""

  " for insert mode
  set pastetoggle=<f2>

""""""""""""""""""""""""""""""""""""""""
"
"             filetype
"
""""""""""""""""""""""""""""""""""""""""

  " Enable filetype plugin
  " for i_Ctrl-X_Ctrl-O
  filetype plugin on

""""""""""""""""""""""""""""""""""""""""
"
"             indent
"
""""""""""""""""""""""""""""""""""""""""
  " visually displaying indent levels in Vim
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
  map ,ig <leader>ig<cr>

  " check :h filetype-indent-on
  " have proper indent level based on syntax
  filetype indent on

  " if you use <tab> to indent the code
  " vim use tabs other than spaces for the indentaion
  " expandtab will turn a tab into "tabstop" spaces
  set expandtab
  set tabstop=2


  " if you use ">" or "<c-t> to indent the code, this matters
  " this default to 8
  set shiftwidth=2

  " you can also set different indent level for other languages
  autocmd FileType c setlocal shiftwidth=4 tabstop=4

""""""""""""""""""""""""""""""""""""""""
"
"             buffers
"
""""""""""""""""""""""""""""""""""""""""

  set hidden "in order to switch between buffers with unsaved change 
  map <s-tab> :bp<cr>
  map <tab> :bn<cr>
  map ,bd :bd<cr>

""""""""""""""""""""""""""""""""""""""""
"
"     why I use *,* to do mapping?
"
""""""""""""""""""""""""""""""""""""""""

  " inspired by Derek, the reasons:
  " 1. <LEADER> is too long to type
  " 2. *,* is easier to reach than *\*
  " 3. in practice you nerver type in *,v*, but *, v*
  " Derek also do a nomap for *,*
  "   nnomap <c-e> ,
  " I do not do it, since I do not use *,* as a command a lot


""""""""""""""""""""""""""""""""""""""""
"
"             quit quickly
"
""""""""""""""""""""""""""""""""""""""""

  map ,f :q!<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             vimrc editing
"
""""""""""""""""""""""""""""""""""""""""

  " I need a fake ~/.vimrc: runtime vimrc
  " http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
  map ,e :e ~/.vim/vimrc<CR>
  " When vimrc is edited, reload it
  " copied from http://amix.dk/vim/vimrc.html
  autocmd! bufwritepost vimrc source ~/.vim/vimrc


""""""""""""""""""""""""""""""""""""""""
"
"            quick escape
"
""""""""""""""""""""""""""""""""""""""""

  " set quick escape from insert mode, and now I can go without arrow keys and
  " use j and k to move around in insert mode
  imap jj <esc>

""""""""""""""""""""""""""""""""""""""""
"
"             wildmode
"
""""""""""""""""""""""""""""""""""""""""

  " use <C-D> with this to get a list
  set wildmenu

""""""""""""""""""""""""""""""""""""""""
"
"             dictionary
"
""""""""""""""""""""""""""""""""""""""

  " i_CTRL_X_K
  set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

""""""""""""""""""""""""""""""""""""""""
"
"             Search
"
""""""""""""""""""""""""""""""""""""""""

  " ic also has effect on dictionary settings
  set ic
  "set hlsearch
  set incsearch

""""""""""""""""""""""""""""""""""""""""
"
"             status line
"
""""""""""""""""""""""""""""""""""""""""

  " Set the status line the way i like it
  set statusline=%F:\ %l

  " tell VIM to always put a status line in, even if there is only one window
  " this means I can also see what is the filename I am in, finally!
  set laststatus=2

""""""""""""""""""""""""""""""""""""""""
"
"             misc
"
""""""""""""""""""""""""""""""""""""""""

  " have nice $ sign when you use `cw`
  set cpoptions+=$

  " Do not know how to use autocmd yet, so the following line not working
  " autocmd FileType text setlocal textwidth=78
  set textwidth=78


  " get rid of the silly characters in window separators
  set fillchars=""

  " hello-world is now one world
  set isk+=-

  " Highlight all instances of the current word under the cursor
  " nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>
  " cd to the directory containing the file in the buffer
  nmap <silent> ,cd :lcd %:h<CR>
  nmap <silent> ,md :!mkdir -p %:p:h<CR>

