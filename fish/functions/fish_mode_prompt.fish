function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color brgreen
            echo '[n] '
        case insert
            set_color brblack
            echo '[i] '
        case visual
            set_color brgreen
            echo '[v] '
    end
end
