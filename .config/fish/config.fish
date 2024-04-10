if status is-interactive
    # Commands to run in interactive sessions can go here

    starship init fish | source
    zoxide init fish | source

    bind \b backward-kill-word
end

# Aliases
alias ls="ls --color=auto"
alias ll="exa -la"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
alias pacman="pacman --color=auto"
alias grupdate="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias s="kitty +kitten ssh"

abbr -a t tldr
abbr -a m batman

function update --description 'Update packages from the repos, the AUR and Flatpak'
    paru -Syu --devel --nocheck && flatpak update
end

# Expand "...." to "../../../"
function expand_dots
    string repeat "../" -n (math (string length $argv[1]) - 1)
end
abbr -a dots --position anywhere --regex "\.{3,}" --function expand_dots

# Variables
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
set fzf_preview_dir_cmd exa --all --color=always
set -g -x GPG_TTY (tty)

string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)
