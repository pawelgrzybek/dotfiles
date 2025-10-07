# Syntax highlighting variables
# https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
set fish_color_normal magenta
set fish_color_command brwhite
set fish_color_keyword brwhite
set fish_color_quote brwhite
set fish_color_redirection brwhite
set fish_color_end brwhite
set fish_color_error red
set fish_color_param brwhite
set fish_color_valid_path brwhite
set fish_color_option brwhite
set fish_color_comment brblack
set fish_color_selection brwhite --background brblack
set fish_color_operator brwhite
set fish_color_escape brwhite
set fish_color_autosuggestion brblack
set fish_color_cwd magenta
set fish_color_cwd_root magenta
set fish_color_user brwhite
set fish_color_host brwhite
set fish_color_host_remote brwhite
set fish_color_status white
set fish_color_cancel red --bold
set fish_color_search_match green
set fish_color_history_current green

# Pager color variables
# https://fishshell.com/docs/current/interactive.html#pager-color-variables
set fish_pager_color_progress magenta
set fish_pager_color_background normal
set fish_pager_color_prefix brwhite --bold
set fish_pager_color_completion brblack
set fish_pager_color_description brblack
set fish_pager_color_selected_background --background=brblack
set fish_pager_color_selected_prefix brwhite
set fish_pager_color_selected_completion white
set fish_pager_color_selected_description brblack
set fish_pager_color_secondary_background normal
set fish_pager_color_secondary_prefix white --bold
set fish_pager_color_secondary_completion brblack
set fish_pager_color_secondary_description brblack

# utility shortcuts improved
abbr --add mv mv -iv
abbr --add cp cp -riv
abbr --add mkdir mkdir -vp
abbr --add ls ls -F
abbr --add ll ls -la
abbr --add yolo "brew upgrade && pnpm update --global --latest"
abbr --add byebye_node_modules find . -name node_modules -type d -prune -exec rm -rf '{}' +

# some git shortcuts
abbr --add gti git
abbr --add g git
abbr --add gs git status
abbr --add gl git log
abbr --add gc git commit
abbr --add ga git add
abbr --add gaa git add -A
abbr --add gb git branch
abbr --add gco git checkout
abbr --add gcom git checkout master
abbr --add gsw git switch
abbr --add gacm "git add -A && git commit -m"
abbr --add gaca "git add -A && git commit --amend --no-edit"
abbr --add gprmaster git pull --rebase origin master
abbr --add gprmain git pull --rebase origin main
abbr --add gpfwl git push --force-with-lease
abbr --add gitupdatemaster "git switch master && git pull && git switch -"
abbr --add gitcleanup git branch | grep -v master | xargs git branch -D

abbr --add lg lazygit --use-config-file="$HOME/.config/lazygit/config.yml"

# why your mac is so slow?
abbr --add top top -o vsize

abbr --add docker-mongodb "docker run --name mongodb -d -p 27017:27017 -v ~/Developer/data mongo"
abbr --add docker-mongodb-exec "docker exec -it mongodb bash -c \"mongo\""
abbr --add docker-prune-every-fucking-thing "docker system prune --all --volumes"

alias n="nvim"
alias v="nvim"
alias vim="nvim"
alias y="yazi"

set -g fish_key_bindings fish_vi_key_bindings
set -gx EDITOR nvim

# use nvim to browse man pages
set -gx MANPAGER "nvim +Man!"

# setup go toolchain
set -gx PATH $PATH (go env GOPATH)/bin


# pnpm
set -gx PNPM_HOME /Users/pawelgrzybek/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

