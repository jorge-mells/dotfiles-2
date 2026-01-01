# NOTE: use this instead of echo for more controlled logging
_log() {
  if [ "$DOTFILES_VERBOSE" = "true" ]; then
    echo "$@"
  fi
}

_log "creating functions"
# Easily start a tmux session with this function which is bound to alt-s
_sesh_fzf() {
  local session
  # Prepend "Default" to the list
  session=$( (echo "Default"; sesh list -H -i) | fzf --ansi --height 40% --reverse --border --header " Select Session " --no-select-1)

  if [ $? -eq 0 ]; then
    READLINE_LINE=""
    
    if [[ "$session" == "Default" || -z "$session" ]]; then
      # Passing an empty string to connect usually triggers the default_session logic
      # If that fails, we fallback to the path ~/ which is defined in your toml
      sesh connect "$HOME"
    else
      sesh connect "$session"
    fi
  fi
  READLINE_POINT=0
}


# NOTE: use this to ensure that configs are safely executed
# IMPORTANT!! always pass the tool/binary as the first arg and what you are trying to execute as the second within single quotes
# if you're trying to source some script specific to some binary, pass the binary you want to source the script for.
_safe_setup_tool() {
  local tool=$1
  _log "setting up $tool"

  # if command -v "$tool" >/dev/null 2>&1 ; then(the posix version)
  if command -v "$tool" &> /dev/null; then
    eval "$2"
  else
    _log "please install $tool"
  fi
}

# NOTE: use this to ensure paths are not reexported everytime. pass the path to add as the first param.
# if need be generalise this to work for all variables where you append stuff
_export_path_once() {
  local new_path=$1

  case ":${PATH}:" in
    *:"$new_path":*)
      ;;
    *)
      export PATH="$new_path:$PATH"
      ;;
  esac
}

# find out how to find help
help_help() {
  echo "To search for stuff you may use help, info, man(man -a intro), apropos(whatis), which(whereis), type,
  whois(for network stuff), tldr, cheat(there's curl cheat), navi, wikiman(if stuff get real), find, compgen -c (a
  list of all your programs), apt search, dpkg -l | less, (list all programs in path (some extras like pass help to
  them and do tag search with grep or fzf))"
  echo "Or you may use online documentation sources like the-art-of-the-commandline (github), gnu, archwiki, devdocs,
  zeal (if stuff get real), linux mint official docs, ubuntu packages search(packages.ubuntu.com), ubuntu official
  docs"
  echo "Or if you're really lazy (or have no time) just ask chatgpt or do a google search (try to avoid this option as
  much as possible so you learn stuff"
  echo "use cht.sh /~searchkeyword1~searchkeyword2/r or simply navi, or cheat -s 'search term' or cheat -T to see all tags and pick a tag with cheat -t tagname to see all commands under tag or tldr. All these commands have options to list commands, and you can use those as well with fzf or find or something"
  echo "a silly idea is curl linux-commands.labex.io(also a good site) or just go there. labex.io/cheatsheets in general is great"
}
