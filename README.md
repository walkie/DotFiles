# DotFiles

My configuration files and notes to myself for setting up new machines.


## Excluded files

These files and directories contain sensitive information and should be copied
over manually.

 * `.gitconfig`
 * `.profile.private`
 * `.ssh/`


## Setting up Vim

Plugins are managed automatically by
[NeoBundle](https://github.com/Shougo/neobundle.vim), which must be installed
manually:

    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim


## Setting up Emacs

(I only use Emacs for [Proof General](http://proofgeneral.inf.ed.ac.uk/) and
hack it up to act like Vim, so this is a pretty terrible configuration for most
people.)

Plugins are managed manually:

    mkdir ~/.emacs.d
    git clone https://github.com/emacsmirror/evil ~/.emacs.d/evil
    git clone https://github.com/emacsmirror/undo-tree ~/.emacs.d/undo-tree
    git clone https://github.com/emacsmirror/proofgeneral ~/.emacs.d/proofgeneral

Also will need to install [Coq](http://coq.inria.fr/) separately.
