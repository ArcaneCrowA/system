if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf --fish | source
    zoxide init fish | source
    task --completion fish | source

    abbr -a gc 'git add . && git commit'
end

set fish_greeting ""

# Machine-local overrides — source if present
if test -f ~/.config/fish/config.fish.local
    source ~/.config/fish/config.fish.local
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
