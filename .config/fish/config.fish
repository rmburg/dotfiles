if status is-interactive
    # Commands to run in interactive sessions can go here

    # Starship prompt
    starship init fish | source

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

# Variables
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
set fzf_preview_dir_cmd exa --all --color=always
set -g -x GPG_TTY (tty)

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

