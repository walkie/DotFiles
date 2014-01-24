# DotFiles

My configuration files and notes to myself for setting up new machines.


## Excluded files

These files contain sensitive information and should be copied over manually.

 * `.gitconfig`
 * `.profile.private`
 * `.ssh`


## Setting up Vim

Plugins are managed semi-automatically by NeoBundle:

    mkdir -p .vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    ~/.vim/bundle/neoinstall


## Setting up Emacs

(I only use Emacs for Proof General and hack it up to act like Vim, so this is
a pretty terrible configuration for most people.)

Plugins are managed manually:

    mkdir .emacs.d
    git clone https://github.com/emacsmirror/evil ~/.emacs.d/evil
    git clone https://github.com/emacsmirror/undo-tree ~/.emacs.d/undo-tree
    git clone https://github.com/emacsmirror/proofgeneral ~/.emacs.d/proofgeneral

Also will need to install Agda/Coq separately.
