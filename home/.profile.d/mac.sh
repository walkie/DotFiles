# Mac-specific configuration

# Colorful ls output
alias ls='ls -G'

# Needed to make some GTK applications work
export DISPLAY=:0.0

# Yes, I know I'm using bash, please shut up about it
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set up LLVM
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig

# Add Homebrew's sbin and sqlite to path
export PATH=/usr/local/sbin:$PATH
# export PATH=/usr/local/opt/sqlite/bin:$PATH

# Turn on fancy auto-completion for Homebrew stuff
# Depends on: brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Enable iTerm2 shell integrations (should be done late in profile)
# ITERM_INTEGRATION="${HOME}/.iterm2_shell_integration.bash"
# test -e $ITERM_INTEGRATION && source $ITERM_INTEGRATION

# Function to set title of terminal window/tab
# > title wut <-- sets the title to "wut"
# > title     <-- sets the title to $PWD
function title {
  local cmd
  if [ "$1" ]; then
    # set the title to the argument string
    echo -ne "\033]0;$@\007"
  else
    # set the title to $PWD on each prompt
    cmd='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
  fi
  # Include iTerm2 integration calls, if installed
  # if [ -e $ITERM_INTEGRATION ]; then
  #   cmd="${cmd}${cmd:+;}__bp_precmd_invoke_cmd;__iterm2_prompt_command;__bp_interactive_mode"
  # fi
  export PROMPT_COMMAND=$cmd
}
title  # Set the tab title to $PWD initially

# cd that works with Mac file aliases
# from: http://hints.macworld.com/article.php?story=20050828054129701
# function cd {
#   if [ ${#1} == 0 ]; then
#     builtin cd
#   elif [ -d "${1}" ]; then
#     builtin cd "${1}"
#   elif [[ -f "${1}" || -L "${1}" ]]; then
#     path=$(getTrueName "$1")
#     builtin cd "$path"
#   else
#     builtin cd "${1}"
#   fi
# }
