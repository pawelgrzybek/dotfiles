function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color green
            echo '[N] '
        case insert
            set_color brblack
            echo '[I] '
        case visual
            set_color green
            echo '[V] '
    end
end
