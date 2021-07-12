# DotFiles

My configuration files and notes to myself for setting up new machines.


## Excluded files

These files and directories contain sensitive information and should be copied
over manually.

 * `.gitconfig`
 * `.profile.d/private.sh`
 * `.ssh/`


## Installation

 1. Install [GNU Stow](https://www.gnu.org/software/stow/)
 2. Run `make`

The `home` directory contains all the config files I want on every machine.
Stow will symlink these into the system \$HOME directory. The `bin` directory
contains scripts to install on every machine. These are managed separately from
`home` since on some machines my `~/bin` is a symlink and this confuses Stow.

It's important that we don't symlink certain directories into this repository
(e.g. `.stack` and `.vim`) since these will end up containing lots of stuff
that we don't want under version control. The Makefile makes sure these root
directories are already created so that Stow will only link the relevant
contents into them, rather than the whole thing.

By default, Stow ignores `.gitignore` files. There's not a convenient way to
override this, so the Makefile just manually symlinks that file into \$HOME
from the `special` directory.


## Firefox

There are Firefox customizations in `special/userChrome.css`. Unfortunately,
Firefox's profile path includes a random string, so it's not easy to
automatically install it. Find the profile directory, as described
[here](http://kb.mozillazine.org/index.php?title=UserChrome.css), then:

```
ln -s ${pwd}/special/userChrome.css ${firefox-profile}/chrome/userChrome.css
```


## Emacs

Plugins are managed by the built-in package manager and will install
automatically on the first launch. Things are usually weird after this, so
reboot Emacs after the installs are done.

Run `M-x package-list-packages` then `U x` to update installed packages.


## (Neo)vim

The configuration is optimized for Neovim but should work for plain vim, gvim,
and MacVim as well.

Plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug). The
plugin manager should be automatically installed after launching vim for the
first time.

Run `:PlugUpdate` from within vim to install the plugins for the first time,
or to update them.


## Haskell and Rust

Install [ghcup](https://www.haskell.org/ghcup/) and
[rustup](https://www.rust-lang.org/tools/install) to manage the Haskell and
Rust toolchains, respectively. My Bash profile will extend the PATH
appropriately.


## Platform-specific stuff

### Fedora

 * Add the [RPM Fusion](https://rpmfusion.org/Configuration) repositories.

 * Install [TeX-Live](https://tug.org/texlive/quickinstall.html) directly since
   Fedora's packaged version omits some non-free bits.

   * Then install the non-free LaTeX fonts:

     ```
     wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
     sudo env "PATH=$PATH" texlua install-getnonfreefonts
     sudo env "PATH=$PATH" getnonfreefonts --sys --all
     sudo cp $(kpsewhich -var-value TEXMFSYSVAR)/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
     sudo fc-cache -fsv
     ```

### Mac

 * Install [Homebrew](http://brew.sh/)
 
   * Then install Homebrew cask:
     ```
     brew tap caskroom/cask
     ```

 * Install MacTeX:
   ```
   brew cask install mactex
   ```

   * Then install the non-free LaTeX fonts:

     ```
     wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
     texlua install-getnonfreefonts
     getnonfreefonts --all
     ```

 * Compile [getTrueName.c](http://hints.macworld.com/dlfiles/getTrueName.txt),
   and put in `~/bin` so `cd` works with Mac aliases.

 * Install the [Liberation fonts](https://fedorahosted.org/liberation-fonts/)


### Windows

There's a custom PowerShell prompt in `windows` and some WSL-specific stuff in
`wsl`. Install these manually, if needed.
