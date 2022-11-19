# DotFiles

My configuration files and notes to myself for setting up new machines.


## Excluded files

These files and directories contain sensitive information and should be copied
over manually:

- `.gitconfig`
- `.profile.d/private.sh`
- `.ssh/`

This file, if present, contains machine-specific configuration:

- `.profile.d/local.sh`


## Installation

1. Install [GNU Stow](https://www.gnu.org/software/stow/)
2. Run `make`

The `home` directory contains all the config files I want on every machine. The
`linux/home` and `mac/home` directories contain config files specific to the
relevant platform. The Makefile uses Stow to symlink all of these files into
the system \$HOME directory.

If a directory doesn't already exist in \$HOME, Stow will link the whole
directory into this repository. However, that's sometimes undesirable, such as
when the contents of a directory come from multiple Stow locations or when the
directory will also contain things that we don't want under version control
(e.g. `stack`). The Makefile ensures that these directories are already created
so that Stow will only link the relevant contents into them, rather than
linking the directory itself.

By default, Stow ignores `.gitignore` files. There's not a convenient way to
override this, so the Makefile just manually symlinks that file into \$HOME
from the `special` directory.


## Terminal environment

Install [Alacritty](https://alacritty.org/) and [tmux](https://github.com/tmux/tmux)
using the relevant package manager.

Install the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm):
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install plugins within tmux with `Ctrl-Space I`.


## (Neo)vim

The configuration is optimized for Neovim but should (not tested in a long
time, so probably not anymore!) work for plain vim, gvim, and MacVim as well.

Plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug). The
plugin manager should be automatically installed after launching vim for the
first time.

Run `:PlugUpdate` from within vim to install the plugins for the first time,
or to update them.


## Emacs

Plugins are managed by the built-in package manager and will install
automatically on the first launch. Things are usually weird after this, so
reboot Emacs after the installs are done.

Run `M-x package-list-packages` then `U x` to update installed packages.


## Haskell

Install [ghcup](https://www.haskell.org/ghcup/). Select the following options:
- Don't update path.
- Install HLS for LSP support.
- Enable better integration with `stack`.


# Rust

Install [rustup](https://www.rust-lang.org/tools/install). Customize the
installation to not update the PATH since my profile already does that.

Install `rust-analyzer` for LSP support:
```
rustup component add rust-analyzer
rustup component add rust-src
```


## Platform-specific stuff

### Fedora

- Add the [RPM Fusion](https://rpmfusion.org/Configuration) repositories.

- Install [TeX-Live](https://tug.org/texlive/quickinstall.html) directly since
  Fedora's packaged version omits some non-free bits.

	- Install non-free LaTeX fonts:
	  ```
	  wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
	  sudo env "PATH=$PATH" texlua install-getnonfreefonts
	  sudo env "PATH=$PATH" getnonfreefonts --sys --all
	  sudo cp $(kpsewhich -var-value TEXMFSYSVAR)/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
	  sudo fc-cache -fsv
	  ```


### Mac

- Install [Homebrew](http://brew.sh/).
 
- Install updated bash and follow instructions to make it the default shell:
  ```
  brew install bash
  ```

- Install bash completion framework for updated bash (do this early or you'll
  have to reinstall other packages) and follow instructions to set it up:
  ```
  brew install bash-completion@2
  ```

- Install fonts:
  ```
  brew tap homebrew/cask-fonts
  brew install font-liberation font-fira-code font-inconsolata
  ```

- Install core tools:
  ```
  brew install firefox alacritty tmux neovim git github mactex
  ```

- Install and start [skhd](https://github.com/koekeishiya/skhd):
  ```
  brew install skhd
  brew services start skhd
  ```

### Windows

There's a custom PowerShell prompt in `windows` and some WSL-specific stuff in
`windows/wsl`. Install these manually, if needed.
