# Figure out what OS we're on
case "$(uname -s)" in
  Darwin) myOS=Mac;;
  Linux)  myOS=Linux;;
  *) echo "Unrecognized operating system: $(uname -s)"
esac

# Include external variable definitions
source ~/.profile.d/colors.sh
source ~/.profile.d/private.sh

# Set prompt and title bar
export PS1=">> $BLUE\u$NO_COLOR@$BLUE\h $GREEN\t $RED\w$NO_COLOR \n\$ "
# export PROMPT_COMMAND='EXIT_TEMP=$?; if [ $EXIT_TEMP -ne 0 ]; then echo "[Exit code: $EXIT_TEMP]"; fi'

# Set default editor
export EDITOR=vim

# History tweaking
shopt -s histappend                        # support multiple shells
export HISTCONTROL=ignorespace             # ignore commands starting with space
export HISTIGNORE=ls:bg:fg:exit            # ignore some boring commands
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S " # store a time stamp with each entry
export HISTSIZE=10000                      # store ten thousand entries instead of 500
export HISTFILESIZE=1000000

# Aliases
alias cp="cp -i"
alias mv="mv -i"
alias du='du -h'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'
alias view='vim -R'
alias access='ssh $ACCESS'

# If no system-wide GHC, use stack's
if ! [ -x "$(command -v ghc)" ]; then
  alias ghc='stack ghc --'
  alias ghci='stack ghci --'
fi

# Use pyenv for managing multiple Python versions, if installed
if [ -d ~/.pyenv ]; then
  export PATH=~/.pyenv/bin:$PATH
  # pyenv is super slow all of a sudden, uncomment these lines if needed
  # or once this issue is fixed: https://github.com/pyenv/pyenv-virtualenv/issues/259
  # eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi

# Do platform specific configuration
if [ $myOS == "Linux" ]; then
  source ~/.profile.d/linux.sh
elif [ $myOS == "Mac" ]; then
  source ~/.profile.d/mac.sh
fi

# Add local bins
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH

# Update path for OS X applications
if [ $myOS == "Mac" ]; then
  launchctl setenv PATH $PATH
fi
