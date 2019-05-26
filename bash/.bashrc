# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in ~/dev/dotfiles/bash/{bash_prompt.sh,exports.sh,aliases.sh,functions.sh}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

shopt -s autocd # Mudar diretório sem cd

# * ~/.extra can be used for other settings you don’t want to commit.
source ~/.extra;

# Scripts
# USE: nn
source ~/dev/dotfiles/scripts/ninjanotes.sh;