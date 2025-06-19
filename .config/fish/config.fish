if status is-interactive
    starship init fish | source
    zoxide init fish | source

    bind \b backward-kill-word
end

# Variables
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
set fzf_preview_dir_cmd eza --all --color=always
set -g -x GPG_TTY (tty)

# Aliases
alias ls="ls --color=auto"
alias ll="eza -la"
alias llt="eza -laT"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
alias s="kitty +kitten ssh"
alias pacman="pacman --color=auto"
alias grupdate="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Abbreviations
abbr -a -- m batman
abbr -a -- t tldr
abbr -a -- ia ip -br a
abbr -a -- ncu nmcli con up
abbr -a -- ncd nmcli con down

# Git abbreviations
abbr -a -- glra git pull --rebase --autostash
abbr -a -- grsh git remote show
abbr -a -- grsp git restore --patch
abbr -a -- grstp git restore --staged --patch
abbr -a -- gstas git stash push --staged
abbr -a -- gstau git stash push --include-untracked

function update --description 'Update packages from the repos, the AUR and Flatpak'
    paru -Syu --devel --nocheck && flatpak update
end

# Expand "...." to "../../../"
function expand_dots
    string repeat "../" -n (math (string length $argv[1]) - 1)
end
abbr -a dots --position anywhere --regex "\.{3,}" --function expand_dots
