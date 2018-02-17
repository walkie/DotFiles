# DotFiles

My configuration files and notes to myself for setting up new machines.


## Linux and Mac

### Excluded files

These files and directories contain sensitive information and should be copied
over manually.

 * `.gitconfig`
 * `.profile.private`
 * `.ssh/`

### Installation

 1. Install [GNU Stow](https://www.gnu.org/software/stow/)
 2. Run `make`

The `home` directory contains all the config files I want on every machine.
Stow will symlink these into the system \$HOME directory.

It's important that we don't symlink certain directories into this repository
(e.g. `.stack` and `.vim`) since these will end up containing lots of stuff
that we don't want under version control. So the Makefile makes sure these root
directories are already created so that stow will only link the relevant
contents into them, rather than the whole thing.

By default, stow ignores `.gitignore` files. There's not a convenient way to
override this, so the Makefile just manually symlinks that file into \$HOME
from the `special` directory.

### Vim

Plugins are managed automatically by [vim-plug](https://github.com/junegunn/vim-plug).
The plugin manager should be automatically installed after launching vim for
the first time. Run `:PlugUpdate` from within vim to install the plugins.

### Haskell

Install [Haskell Stack](https://docs.haskellstack.org/en/stable/README/)
directly since the packaged versions lag behind.

Currently I have a global GHC installed directly, which Stack uses. I should
probably just install GHC through stack and then `alias ghc="stack ghc"`, etc.

### Linux Packages

With the relevant package manager, install at least these packages:
 * git
 * pandoc
 * tex-live

### Mac Packages

 * Install [Homebrew](http://brew.sh/) and at least these packages:

   ```
   brew install git
   brew install pandoc
   brew install curl
   brew install wget
   brew tap caskroom/cask
   brew cask install mactex
   brew cask install macvim
   ```

 * Compile [getTrueName.c](http://hints.macworld.com/dlfiles/getTrueName.txt),
   and put in `~/bin` so `cd` works with Mac aliases.

### Fonts

 * After installing TeX-Live, also install the non-free LaTeX fonts:

   ```
   wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
   texlua install-getnonfreefonts
   getnonfreefonts --all
   ```

 * Install the [Liberation fonts](https://fedorahosted.org/liberation-fonts/)


## Windows

There's a custom PowerShell prompt in `windows` and some WSL-specific stuff in
`wsl`. Install these manually, if needed.


## Emacs (Old)

I only use Emacs for [Proof General](http://proofgeneral.inf.ed.ac.uk/) and
hack it up to act like Vim, so this is a pretty terrible configuration for most
people.

Install [Aquamacs](http://aquamacs.org/). From within Aquamacs:

    Tools -> Install Command Line Tools

Plugins are managed manually:

    mkdir ~/.emacs.d
    git clone https://github.com/emacsmirror/evil ~/.emacs.d/evil
    git clone https://github.com/emacsmirror/undo-tree ~/.emacs.d/undo-tree
    git clone https://github.com/emacsmirror/proofgeneral ~/.emacs.d/proofgeneral

Also will need to install [Coq](http://coq.inria.fr/) separately.
