# Setup fzf
# ---------
if [[ ! "$PATH" == */home/neni/.fzf/bin* ]]; then
  export PATH="$PATH:/home/neni/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/neni/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/neni/.fzf/shell/key-bindings.bash"

