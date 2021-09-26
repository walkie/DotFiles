# Linux-specific configuration

# Colorful ls output
alias ls='ls --color'

# Coloring fix for weird directory permissions under WSL
if grep -q Microsoft /proc/version; then
  export LS_COLORS="ow=01;34;40"
fi

# Restart Gnome Shell
alias restart-gnome-shell='busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s '\''Meta.restart("Restarting Gnome Shell...")'\'

# Set title of terminal window/tab
function title {
  export PROMPT_COMMAND=
  echo -ne "\033]0;$@\007"
}

# Silently open files with default application.
function open {
  xdg-open "$@" &> /dev/null
}

# Use vim with X support, if available.
# if [ -x "$(command -v gvim)" ]; then
#   alias vim='gvim -v'
# fi

# Turn off auto-search for command when not found (annoying delay)
unset command_not_found_handle

# Idris 2
PATH=~/.idris2/bin:$PATH
export LD_LIBRARY_PATH=~.idris2/lib:$LD_LIBRARY_PATH

# Racket
PATH=~/Dropbox/Linux/Install/racket/bin:$PATH

# Snap packages
PATH=/var/lib/snapd/snap/bin:$PATH

# Configure TeX-Live
export INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH
export PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
