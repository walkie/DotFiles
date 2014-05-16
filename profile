# Include external variable definitions
. ~/.colors
. ~/.profile.private

# Set prompt and title bar
export PS1=">> $BLUE\u$NO_COLOR@$BLUE\h $GREEN\t $RED\w$NO_COLOR \n\$ "
# export PROMPT_COMMAND='EXIT_TEMP=$?; if [ $EXIT_TEMP -ne 0 ]; then echo "[Exit code: $EXIT_TEMP]"; fi'

# Environment variables
export PATH=/usr/local/bin:$PATH
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
TEXLIVE=/usr/local/texlive/2012/
export PATH=$TEXLIVE/bin/x86_64-darwin:$PATH
export MANPATH=$TEXLIVE/doc/man:$MANPATH

# Set up Haskell
HASKELL_PLATFORM=~/Library/Haskell
export PATH=$HASKELL_PLATFORM/bin:$PATH

# Set up Coq
COQ=/Applications/CoqIdE_8.3pl4.app/Contents/Resources
export PATH=$COQ/bin:$PATH
export MANPATH=$COQ/man:$MANPATH

# Set up Scala
SCALA=~/Documents/Code/libs/scala-2.10.2
export PATH=$SCALA/bin:$PATH
export MANPATH=$SCALA/man:$MANPATH

# Set up Git
GIT=/usr/local/git
export PATH=$GIT/bin:$PATH
export MANPATH=$GIT/share/man/git-manpages:$MANPATH

# Set up SQLite
SQLITE=/usr/local/Cellar/sqlite/3.8.4.3
export PATH=$SQLITE/bin:$PATH
export MANPATH=$SQLITE/share/man/man1:$MANPATH

# Set up libraries installed by Homebrew
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig:$PKG_CONFIG_PATH

# Add local bin last
export PATH=~/bin:$PATH

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
alias kisumu='ssh $KISUMU'
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

# RVM added this...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
