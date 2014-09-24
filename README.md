# DotFiles

My configuration files and notes to myself for setting up new machines.


## Excluded files

These files and directories contain sensitive information and should be copied
over manually.

 * `.gitconfig`
 * `.profile.private`
 * `.ssh/`


## Installation

(Most of) the contents of this repository are recursively hard-linked to the
home directory to share changes between the two and avoid the occasional
problem caused by sym-links.

The script `install.rb` automates this linking and also sets up the vim plugin
manager. It doesn't automate the setup of emacs.

New config files must be either manually linked into the repository, or else
copied into the repository followed by re-running the install script.


## Setting up Vim

Plugins are managed automatically by [NeoBundle](https://github.com/Shougo/neobundle.vim).
The install script does the following:

    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim


## Setting up Emacs

(I only use Emacs for [Proof General](http://proofgeneral.inf.ed.ac.uk/) and
hack it up to act like Vim, so this is a pretty terrible configuration for most
people.)

Install [Aquamacs](http://aquamacs.org/). From within Aquamacs:

    Tools -> Install Command Line Tools

Plugins are managed manually:

    mkdir ~/.emacs.d
    git clone https://github.com/emacsmirror/evil ~/.emacs.d/evil
    git clone https://github.com/emacsmirror/undo-tree ~/.emacs.d/undo-tree
    git clone https://github.com/emacsmirror/proofgeneral ~/.emacs.d/proofgeneral

Also will need to install [Coq](http://coq.inria.fr/) separately.


## Miscellaneous

A few other miscellaneous things that need to be done manually.

 * Compile [getTrueName.c](http://hints.macworld.com/dlfiles/getTrueName.txt),
   and put in `~/bin` so `cd` works with Mac aliases.

 * Install [Haskell Platform](http://www.haskell.org/platform/)

 * Install [MacVim](https://code.google.com/p/macvim/) and copy `mvim` script
   into `~/bin`.
 
 * Install [Liberation fonts](https://fedorahosted.org/liberation-fonts/)

 * Install [Homebrew](http://brew.sh/)

 * Install [TeXLive](https://www.tug.org/texlive/)

   * Plus install non-free fonts:

     ```
     wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
     texlua install-getnonfreefonts
     getnonfreefonts --all
     ```
