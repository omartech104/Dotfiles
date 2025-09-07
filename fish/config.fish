if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Initialize Starship prompt
starship init fish | source

# FZF colors (Catppuccin Mocha)
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:-1,bg:-1,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# Ensure pipx path is available
set -Ux PATH $PATH /home/omartech/.local/bin

# Aliases
alias install "yay -S"
alias remove "yay -R"
alias upgrade "yay -Syu"
alias update "yay -Sy"
alias ls "eza --icons"
alias zellij 'zellij --layout compact'
alias neofetch 'fastfetch --config os'
alias v 'nvim'
alias bat 'bat --theme="Catppuccin Mocha"'
# Remove default fish greeting

set -g fish_greeting ""

set EDITOR "nvim"

zoxide init fish | source

abbr --erase cd &>/dev/null
alias cd=__zoxide_z

function last_history_item
    echo $history[1]
end

abbr -a !! --position anywhere --function last_history_item

# Created by `pipx` on 2025-07-24 08:35:22
set PATH $PATH /home/omartech/.local/bin
