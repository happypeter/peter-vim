"""""""""""""""""""""""""""""""""""""""""
"
"       CtrlP
"
""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

""""""""""""""""""""""""""""""""""""""""
"
"       auto-save
"
""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1

"""""""""""""""""""""""""""""""""""""""""
"
"       tComment
"
""""""""""""""""""""""""""""""""""""""""

  " Use Ctrl-c to comment and uncomment, cool
  map <c-c> gcc

"""""""""""""""""""""""""""""""""""""""""
"
"       rails.vim
"
""""""""""""""""""""""""""""""""""""""""
  " I don't use Rcontroller... stuff a lot
  " cause I have CtrlP, but rails.vim provide me `gf` for rails projects

""""""""""""""""""""""""""""""""""""""""
"
"       for Mac
"
""""""""""""""""""""""""""""""""""""""""

  " vim run in Mac terminal, does not have syntax highlighting without this
  syntax on

""""""""""""""""""""""""""""""""""""""""
"
"       for markdown
"
""""""""""""""""""""""""""""""""""""""""

  " when you have .md file, default ft=modula2, thus wrong highlighting
  autocmd FileType modula2 set ft=


""""""""""""""""""""""""""""""""""""""""
"
"             pathogen
"
""""""""""""""""""""""""""""""""""""""""

  " doorkeeper of all my vim plugins
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

  " check :h filetype-indent-on
  " have proper indent level based on syntax
  " `=` also depends on this to work
  filetype indent on

  " if you use <tab> to indent the code
  " vim use tabs other than spaces for the indentaion
  " expandtab will turn a tab into 'tabstop' spaces
  set expandtab
  set tabstop=2


  " if you use '>' or <c-t> to indent the code, this matters
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

  " change cwd to current buffer
  nmap <silent> ,cd :lcd %:h<CR>
