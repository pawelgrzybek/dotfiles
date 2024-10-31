function helix-config --argument-names type
    switch $type
        case mini
            cp ~/.dotfiles/helix/config-mini.toml ~/.dotfiles/helix/config.toml
        case base
            cp ~/.dotfiles/helix/config-base.toml ~/.dotfiles/helix/config.toml
        case '*'
            echo "Unknown type. Only `base` and `mini` are available."
    end
end
