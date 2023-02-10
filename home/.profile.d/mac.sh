# Mac-specific configuration

# Colorful ls output
alias ls='ls -G'

# Needed to make some GTK applications work
export DISPLAY=:0.0

# Yes, I know I'm using bash, please shut up about it
export BASH_SILENCE_DEPRECATION_WARNING=1

# Alias to mount encrypted Dropbox directory to ~/Vault
alias vault='encfs -o volname=Vault ~/Dropbox/.encrypted ~/Vault'

# Update paths to include Homebrew stuff
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load bash completions for Homebrew stuff
# Depends on: brew install bash-completion@2 (and updated bash shell)
if [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]]; then
  source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
fi

# Add Scala (managed with Coursier)
if [ -x "$(command -v cs)" ]; then
  export PATH="$PATH:/Users/walkie/Library/Application Support/Coursier/bin"
  export JAVA_HOME="$(cs java-home)"
fi
