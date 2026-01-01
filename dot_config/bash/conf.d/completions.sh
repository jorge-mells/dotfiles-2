# NOTE: store completions in .local/share/bash-completion/completions
# apparently, you don't need to source them. just place them there. sourcing stuff actually slows down the system
# Also, don't forget to sudo install bash-completion(s), since it might not exist on some systems

_log "setting up completions"
# Enable bash-completion if it exists
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
