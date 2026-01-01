_log "exporting variables"
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config
export VIMDOTDIR='$HOME/.config/vim'
# --- Very Large History (Finite) ---
# 20000 commands in memory and on disk
export HISTSIZE=20000
export HISTFILESIZE=20000

# --- History Filtering ---
# ignoreboth = ignoredups (don't save same command twice) + ignorespace (don't save commands starting with space)
export HISTCONTROL=ignoreboth:erasedups

# -- REALTIME HISTORY SYNC
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# PATH CHANGES
# NOTE: always prepend to path!! Do not append.
# NOTE: use _export_path_once to ensure paths are not reexported everytime. pass the path to add as the first param.

# GO EXPORTS
_export_path_once "/usr/local/go/bin"
_export_path_once "$(go env GOPATH)/bin"
