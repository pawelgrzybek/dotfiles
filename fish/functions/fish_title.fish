function fish_title 
    if test "$__git_repo" = 1
        if test $__git_dirty = 1
            set git_repo_dirty ' ✘'
        else
            set git_repo_dirty ' ✔'
        end

        echo (path basename $PWD)"$git_repo_dirty"
    else
        echo (prompt_pwd --dir-length=0)
    end
end
