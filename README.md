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
problem caused by sym-links. The script `install.rb` automates this linking.

New config files must be either manually linked into the repository, or else
copied into the repository followed by re-running the install script.


## Setting up Vim

Plugins are managed automatically by [vim-plug](https://github.com/junegunn/vim-plug).
The plugin manager should be automatically installed after launching vim for
the first time. Run `:PlugUpdate` from within vim to install the plugins.


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

 * Install [Homebrew](http://brew.sh/) and at least these packages:
   
   ```
   brew install git
   brew install ghc
   brew install haskell-stack
   brew install pandoc
   brew install curl
   brew install wget
   brew tap caskroom/cask
   brew cask install mactex
   brew cask install macvim
   ```

 * Install non-free LaTeX fonts:

   ```
   wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
   texlua install-getnonfreefonts
   getnonfreefonts --all
   ```
 
 * Install [Liberation fonts](https://fedorahosted.org/liberation-fonts/)
 
 * Compile [getTrueName.c](http://hints.macworld.com/dlfiles/getTrueName.txt),
   and put in `~/bin` so `cd` works with Mac aliases.
