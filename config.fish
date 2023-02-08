if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Fish_greeting
set -g fish_greeting

# XDG
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# Cargo(Rust package manager)
set -gx CARGO_HOME "$XDG_CONFIG_HOME/cargo"

# Nimble
set -gx nimbleDir "XDG_CONFIG_HOME/nimble/.nimble/"

# EDITOR
set -gx EDITOR nvim
set -gx VISUAL nvim

# Make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end

# Get terminal emulator
set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')

# FZF
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --no-ignore'
set -gx FZF_DEFAULT_OPTS "
--height=60% --layout=reverse --border --info=inline --margin=1 --padding=1 
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
"
