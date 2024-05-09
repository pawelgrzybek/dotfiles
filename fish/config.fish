# Syntax highlighting variables
# https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
set fish_color_normal white
set fish_color_command white
set fish_color_keyword white
set fish_color_quote white
set fish_color_redirection white
set fish_color_end white
set fish_color_error red
set fish_color_param white
set fish_color_valid_path white
set fish_color_option white
set fish_color_comment brblack
set fish_color_selection green
set fish_color_operator white
set fish_color_escape white
set fish_color_autosuggestion brblack
# set fish_color_cwd white
# set fish_color_cwd_root white
# set fish_color_user white
# set fish_color_host white
# set fish_color_host_remote white
# set fish_color_status white
set fish_color_cancel red --bold
set fish_color_search_match green
set fish_color_history_current green

# Pager color variables
# https://fishshell.com/docs/current/interactive.html#pager-color-variables
set fish_pager_color_progress green
# set fish_pager_color_background --background=brblack
set fish_pager_color_prefix white --bold
set fish_pager_color_completion brblack
set fish_pager_color_description white
set fish_pager_color_selected_background --background=blue
set fish_pager_color_selected_prefix brblack --bold
set fish_pager_color_selected_completion brblack
set fish_pager_color_selected_description brblack
# set fish_pager_color_secondary_background --background=brblack
set fish_pager_color_secondary_prefix white --bold
set fish_pager_color_secondary_completion brblack
set fish_pager_color_secondary_description white

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

# why your mac is so slow?
abbr --add top top -o vsize

abbr --add docker-mongodb "docker run --name mongodb -d -p 27017:27017 -v ~/Developer/data mongo"
abbr --add docker-mongodb-exec "docker exec -it mongodb bash -c \"mongo\""
abbr --add docker-prune-every-fucking-thing "docker system prune --all --volumes"

set PATH $PATH ~/.cargo/bin

# pnpm
set -gx PNPM_HOME /Users/pawelgrzybek/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
