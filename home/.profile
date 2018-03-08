# Include external variable definitions
. ~/.colors
. ~/.profile.private

# Figure out what OS we're on
case "$(uname -s)" in
  Darwin) myOS=Mac;;
  Linux)  myOS=Linux;;
  *) echo "Unrecognized operating system: $(uname -s)"
esac

# Set prompt and title bar
export PS1=">> $BLUE\u$NO_COLOR@$BLUE\h $GREEN\t $RED\w$NO_COLOR \n\$ "
# export PROMPT_COMMAND='EXIT_TEMP=$?; if [ $EXIT_TEMP -ne 0 ]; then echo "[Exit code: $EXIT_TEMP]"; fi'

# Environment variables
if [ $myOS == "Mac" ]; then
  export DISPLAY=:0.0
fi
export EDITOR=vim

# History tweaking
shopt -s histappend                        # support multiple shells
export HISTCONTROL=ignorespace             # ignore commands starting with space
export HISTIGNORE=ls:bg:fg:exit            # ignore some boring commands
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S " # store a time stamp with each entry
export HISTSIZE=10000                      # store ten thousand entries instead of 500
export HISTFILESIZE=1000000

# Set up LLVM
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig

# Homebrew stuff
if [ $myOS == "Mac" ]; then

  # Add Homebrew's sbin and sqlite to path
  export PATH=/usr/local/sbin:$PATH
  export PATH=/usr/local/opt/sqlite/bin:$PATH

  # Turn on fancy auto-completion.
  # Depends on: brew install bash-completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

fi

# Add Cabal and Stack binaries to path
export PATH=~/.cabal/bin:$PATH
export PATH=~/.local/bin:$PATH

# Add Agda to path
export PATH=~/Code/lib/agda/.cabal-sandbox/bin:$PATH

# Add Prolog to path
# if [ $myOS == "Mac" ]; then
#   export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH
# fi

# Add Racket to path
if [ $myOS == "Mac" ]; then
  export PATH=/Applications/Racket-v6.3/bin:$PATH
fi

# Add local bin
export PATH=~/bin:$PATH

# Update path for OS X applications
if [ $myOS == "Mac" ]; then
  launchctl setenv PATH $PATH
fi

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Colorful ls output
if [ $myOS == "Linux" ]; then

  alias ls='ls --color'

  # Coloring fix for weird directory permissions under WSL
  if grep -q Microsoft /proc/version; then
    export LS_COLORS="ow=01;34;40"
  fi

elif [ $myOS == "Mac" ]; then
  alias ls='ls -G'
fi

# Aliases
alias cp="cp -i"
alias mv="mv -i"
alias du='du -h'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'
alias view='vim -R'
alias access='ssh $ACCESS'

# Linux-specific aliases
if [ $myOS == "Linux" ]; then
  alias open='xdg-open'
fi

# Mac-specific aliases
if [ $myOS == "Mac" ]; then
  alias amacs='aquamacs'
  alias updatedb='sudo /usr/libexec/locate.updatedb'
fi

# If no system-wide GHC, use stack's
if ! [ -x "$(command -v ghc)" ]; then
  alias ghc='stack ghc --'
  alias ghci='stack ghci --'
fi

# cd that works with Mac file aliases
# from: http://hints.macworld.com/article.php?story=20050828054129701
if [ $myOS == "Mac" ]; then
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
fi
