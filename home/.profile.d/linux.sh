# Linux-specific configuration

# Colorful ls output
alias ls='ls --color'

# Coloring fix for weird directory permissions under WSL
if grep -q Microsoft /proc/version; then
  export LS_COLORS="ow=01;34;40"
fi

# Silently open files with default application.
function open {
  xdg-open "$@" &> /dev/null
}

# Use vim with X support, if available.
if [ -x "$(command -v gvim)" ]; then
  alias vim='gvim -v'
fi

# Racket
PATH=~/Dropbox/Linux/Install/racket/bin:$PATH

# Snap packages
PATH=/var/lib/snapd/snap/bin:$PATH

# Configure TeX-Live
export INFOPATH=/usr/local/texlive/2017/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2017/texmf-dist/doc/man:$MANPATH
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
