if status is-login
    # Commands to run in interactive sessions can go here
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec hypr -- -keeptty
    end
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

# Keybindings
set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cr history-pager
