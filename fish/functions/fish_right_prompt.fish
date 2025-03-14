function fish_right_prompt
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        if test $(git status --porcelain | count) -gt 0
            set git_repo_dirty (set_color brred)' [•]'(set_color normal)
        else
            set git_repo_dirty (set_color brgreen)' [•]'(set_color normal)
        end

        if test $(git rev-list -n 1 --all | count) -gt 0
            echo (set_color bryellow) (git rev-parse --abbrev-ref HEAD)':'(command git show-ref --head -s --abbrev | head -n1)"$git_repo_dirty"(set_color normal)
        end
    end
end
