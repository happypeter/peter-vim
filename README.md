### Who will love this?
If you do web dev a lot...yes

### Install
1. clone the repo

        git clone git://github.com/happypeter/peter-vim.git

1. rename it

        mv peter-vim ~/.vim

1. set up `~/.vimrc`, have a fake `.vimrc` in your `$HOME`

        ln -s ~/.vim/vimrc ~/.vimrc

1. you also need to install `Ctags`, `ack-grep`

        sudo apt-get install exuberant-ctags ack-grep # for ubuntu

1. vim 注意

   vim 中有 gpg.vim 插件，但是插件能使用的前题是系统上已经安装了 gpg ，也就是先要

   ```
     brew install gpg
   ```

   然后再

   ```
   vim xxx.gpg
   ```

1. Video about how I manage my plugins

   - [vim plugin manage](http://www.haoduoshipin.com/v/30)
