# >>> history settings (optional but helpful)
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# >>> add fzf commands
source <(fzf --zsh)

export PATH="/opt/homebrew/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/adiletbeishekeyev/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
