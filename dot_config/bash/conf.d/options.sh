_log "setting up options and others"
# NOTE: PERSONAL OPTIONS
#
# use vim mode
set -o vi
# Append to the history file immediately, don't wait for shell exit
shopt -s histappend


# NOTE: ssh setup
#
if [ -z "$SSH_AUTH_SOCK" ]; then
  echo "starting a new agent"
  # Start the agent and set environment variables
  eval "$(ssh-agent -s)"
fi
