# Launch Hyprland on tty1 after login
if test "$(tty)" = /dev/tty1
    # exec dbus-launch --exit-with-session Hyprland &> /dev/null
    exec Hyprland &>/dev/null
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Starship prompt
    starship init fish | source
    zoxide init fish | source

    bind \b backward-kill-word
end

# Aliases
alias ls="ls --color=auto"
alias ll="eza -la"
alias llt="eza -laT"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
alias s="kitty +kitten ssh"

# Variables
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path /usr/lib/rustup/bin
set fzf_preview_dir_cmd eza --all --color=always
set -g -x GPG_TTY (tty)

set -x EDITOR hx

string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

#Abbreviations
abbr -a -- m batman
abbr -a -- t tldr
abbr -a -- ia ip -br a

# Expand "...." to "../../../"
function expand_dots
    string repeat "../" -n (math (string length $argv[1]) - 1)
end
abbr -a dots --position anywhere --regex "\.{3,}" --function expand_dots

# Git abbreviations
abbr -a -- grsh git remote show
