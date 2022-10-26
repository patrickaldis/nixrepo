if status is-interactive
    # Commands to run in interactive sessions can go here
end
# fish_vi_key_bindings

direnv hook fish | source
any-nix-shell fish --info-right | source
