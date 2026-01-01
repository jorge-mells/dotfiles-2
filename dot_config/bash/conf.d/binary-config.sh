# NOTE: If this file becomes too large, just modularise it
# The order below is selected so that the most important configs are loaded last
# Later on, experiment breaking up this file into the correct places.


# NOTE: use this to ensure that configs are safely executed
# IMPORTANT!! always pass the tool/binary as the first arg and what you are trying to execute as the second within single quotes
# if you're trying to source some script specific to some binary, pass the binary you want to source the script for.

_log "setting up various binaries"
# CUSTOM
# setup oh-my-posh
_safe_setup_tool oh-my-posh '\
if [ -n "$TERM" ] && [ "$TERM" != "dumb" ] && [ "$(tput colors 2>/dev/null || echo 0)" -ge 256 ]; then\
  # Terminal is capable of colors; load the fancy prompt\
  eval "$(oh-my-posh init bash --config https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/tokyonight_storm.omp.json)";\
fi
'

# TOOL CONFIG
# setup fzf
_safe_setup_tool fzf 'eval "$(fzf --bash)"'

# setup zoxide
_safe_setup_tool zoxide 'eval "$(zoxide init bash)"'

# LANGUAGE TOOLCHAIN CONFIG
# setup cargo
_safe_setup_tool cargo '. "$HOME/.cargo/env"'

# setup nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
