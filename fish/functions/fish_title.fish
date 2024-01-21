function fish_title 
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        if test $(git status --porcelain | count) -gt 0
            set git_repo_dirty ' ✘'
        else
            set git_repo_dirty ' ✔'
        end

        echo (prompt_pwd --dir-length=0)"$git_repo_dirty"
	else
		echo (prompt_pwd --dir-length=0)
    end
end
