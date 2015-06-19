# Include external variable definitions
. ~/.colors
. ~/.profile.private

# Set prompt and title bar
export PS1=">> $BLUE\u$NO_COLOR@$BLUE\h $GREEN\t $RED\w$NO_COLOR \n\$ "
# export PROMPT_COMMAND='EXIT_TEMP=$?; if [ $EXIT_TEMP -ne 0 ]; then echo "[Exit code: $EXIT_TEMP]"; fi'

# Environment variables
export DISPLAY=:0.0
export EDITOR=vim

# History tweaking
shopt -s histappend                        # support multiple shells
export HISTCONTROL=ignorespace             # ignore commands starting with space
export HISTIGNORE=ls:bg:fg:exit            # ignore some boring commands
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S " # store a time stamp with each entry
export HISTSIZE=10000                      # store ten thousand entries instead of 500
export HISTFILESIZE=1000000

# Set up LaTeX
TEXLIVE=/usr/local/texlive/2014/bin/x86_64-darwin
export PATH=$TEXLIVE:$PATH
export MANPATH=$TEXLIVE/man:$MANPATH

# Add Cabal binaries to path
export PATH=~/.cabal/bin:$PATH

# Add Prolog to path
export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH

# Set up LLVM
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig

# Add local bin and update path for OS X applications
export PATH=~/bin:$PATH
launchctl setenv PATH $PATH

# Aliases
alias cp="cp -i"
alias mv="mv -i"
alias du='du -h'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'
alias view='vim -R'
alias amacs='aquamacs'
alias access='ssh $ACCESS'
alias updatedb='sudo /usr/libexec/locate.updatedb'

# cd that works with mac aliases
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
