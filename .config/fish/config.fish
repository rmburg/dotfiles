# Launch Hyprland on tty1 after login
if test "$(tty)" = /dev/tty1
    # exec dbus-launch --exit-with-session Hyprland &> /dev/null
    exec Hyprland &>/dev/null
end

if status is-interactive
    starship init fish | source
    zoxide init fish | source

    bind \b backward-kill-word
end

# Variables
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path /usr/lib/rustup/bin
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
alias pluto='julia -e "using Pluto;Pluto.run()"'

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

# Expand "...." to "../../../"
function expand_dots
    string repeat "../" -n (math (string length $argv[1]) - 1)
end
abbr -a dots --position anywhere --regex "\.{3,}" --function expand_dots
