if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_default_key_bindings

any-nix-shell fish --info-right | source

bind \b backward-kill-word
bind \e\[3\;5~ kill-word
