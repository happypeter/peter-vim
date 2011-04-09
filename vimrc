
""""""""""""""""""""""""""""""""""""""""
"
"             for macbook
"
""""""""""""""""""""""""""""""""""""""""
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"      Cope
"      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
" can be used with vimgrep or anything in quickfix
map ,cc :botright cope<cr>
map ,cn :cn<cr>
map ,cp :cp<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             paste
"
""""""""""""""""""""""""""""""""""""""""
map ,pp :setlocal paste!<cr>
set autoindent

""""""""""""""""""""""""""""""
"
"         Vim grep
"
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = '.git CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          Spell checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map ,ss :setlocal spell!<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             filetype
"
""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
" filetype indent on


""""""""""""""""""""""""""""""""""""""""
"
"             note-taking
"
""""""""""""""""""""""""""""""""""""""""
" with Vim helptags and git, store things 
" $VIMRUNTIME/doc
" NOTE: NO ":" in the following line, stange but works
autocmd FileType help set ma 
autocmd FileType help set noreadonly
autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc


""""""""""""""""""""""""""""""""""""""""
"
"             brower
"
""""""""""""""""""""""""""""""""""""""""
" NOW Browser() only works for lines containing nothing but the link
" refer to http://vim.wikia.com/wiki/VimTip306 
function! Browser ()
  let line = getline (".")
"  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
  exec "!firefox ".line
endfunction
map ,w :call Browser ()<CR>


""""""""""""""""""""""""""""""""""""""""
"
"             open file
"
""""""""""""""""""""""""""""""""""""""""
" xxx keyword|vim -s search.vim -
" only works when the line has no garbage
function! OpenFile ()
  let line = getline (".")
"  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
  exec "e ".line
endfunction
map ,r :call OpenFile ()<CR>


""""""""""""""""""""""""""""""""""""""""
"
"             buffers
"
""""""""""""""""""""""""""""""""""""""""
" in order to switch between buffers
" with unsaved change 
set hidden
" I just use <Tab> to do buffernext, but need to make sure I am in Normal Mode
" Taglist.vim use <Tab> in nomal mode for jumping among different filename in 
" its own window, but I do not feel uncomfortable about this 
map <Tab> :bn<CR>
map ,bd :bd<cr>
""""""""""""""""""""""""""""""""""""""""
"
"             formatting 
"
""""""""""""""""""""""""""""""""""""""""
" this is for C comments, see *fo-table* to know what althese options mean
set fo=croq
""""""""""""""""""""""""""""""""""""""""
"
"             general
"
""""""""""""""""""""""""""""""""""""""""
" why I use *,* to do mapping?
" inspired by Derek, the reasons:
" 1. <LEADER> is too long to type
" 2. *,* is easier to reach than *\*
" 3. in practice you nerver type in *,v*, but *, v*
" Derek also do a nomap for *,*
"   nnomap <c-e> ,
" I do not do it, since I do not use *,* as a command a lot

""""""""""""""""""""""""""""""""""""""""
"
"             taglist
"
""""""""""""""""""""""""""""""""""""""""
map ,t :Tlist<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             Doxygen
"
""""""""""""""""""""""""""""""""""""""""
" highlight the doxygen comments
" used with DoxygenToolkit.vim
let g:load_doxygen_syntax=1

""""""""""""""""""""""""""""""""""""""""
"
"             QT-doc
"
""""""""""""""""""""""""""""""""""""""""
map ,k :!qref <cword><ENTER>

""""""""""""""""""""""""""""""""""""""""
"
"             NERDtree
"
""""""""""""""""""""""""""""""""""""""""
map ,n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             quit quickly
"
""""""""""""""""""""""""""""""""""""""""
" before I use <S-ZZ> to quit, this has the danger of unexpectedly
" save some garbage editing, so I have a safer way now as below
map ,, :q<CR>
" force quit
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
imap JJ <esc>
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
"             tabbing 
"
""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4

""""""""""""""""""""""""""""""""""""""""
"
"             dictionary
"
""""""""""""""""""""""""""""""""""""""
" i_CTRL_X_K 
set dictionary+=~/.vim/dict/simple
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
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

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

" input abrevation 
iab frm from 
" set number for doing diffs and folding
" set nu
" Show the current command in the lower right corner
set showcmd
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
" set scrolloff=8

" Allow the cursor to go in to "invalid" places
" set virtualedit=all

" get rid of the silly characters in window separators
set fillchars=""

" Highlight all instances of the current word under the cursor
" nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>
" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>
""""""""""""""""""""""""""""""""""""""""
"
"             test stuff
"
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"
"             ,
"
""""""""""""""""""""""""""""""""""""""""
nnoremap <c-e> ,
vnoremap <c-e> ,
