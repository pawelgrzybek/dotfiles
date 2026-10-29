function fish_right_prompt
    test "$__git_repo" = 1; or return
    test "$__git_oid" = "(initial)"; and return

    if test $__git_dirty = 1
        set git_repo_dirty (set_color brred)' [•]'(set_color normal)
    else
        set git_repo_dirty (set_color brgreen)' [•]'(set_color normal)
    end

    echo (set_color bryellow) $__git_head':'(string sub -l 7 -- $__git_oid)"$git_repo_dirty"(set_color normal)
end
