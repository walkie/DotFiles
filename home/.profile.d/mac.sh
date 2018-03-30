# Mac-specific configuration

# Needed to make some GTK applications work
export DISPLAY=:0.0

# Set up LLVM
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig

# Add Homebrew's sbin and sqlite to path
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/sqlite/bin:$PATH

# Turn on fancy auto-completion for Homebrew stuff
# Depends on: brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# OPAM configuration
# . ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Add Racket to path
# export PATH=/Applications/Racket-v6.3/bin:$PATH

# Update path for OS X applications
launchctl setenv PATH $PATH

# Colorful ls output
alias ls='ls -G'

# Other aliases
alias updatedb='sudo /usr/libexec/locate.updatedb'
# alias amacs='aquamacs'

# cd that works with Mac file aliases
# from: http://hints.macworld.com/article.php?story=20050828054129701
function cd {
  if [ ${#1} == 0 ]; then
    builtin cd
  elif [ -d "${1}" ]; then
    builtin cd "${1}"
  elif [[ -f "${1}" || -L "${1}" ]]; then
    path=$(getTrueName "$1")
    builtin cd "$path"
  else
    builtin cd "${1}"
  fi
}
