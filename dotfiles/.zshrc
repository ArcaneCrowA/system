# >>> history settings (optional but helpful)
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# >>> add fzf commands
source <(fzf --zsh)

export PATH="/opt/homebrew/bin:$(go env GOPATH)/bin:$PATH"
