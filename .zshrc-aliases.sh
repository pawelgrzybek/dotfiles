# utility shortcuts improved
alias mv="mv -iv" # safer and verbose move
alias cp="cp -riv" # safer, resursive and verbose copy
alias mkdir='mkdir -vp' # verbose mkdir that allows to pass a path
alias ls="ls -F" # show trailing slash with folders
alias ll="ls -la" # show list of all files (including hidden)
alias yolo="brew upgrade && pnpm update --global --latest" # upgrade every-fuckin-thing
alias byebye_node_modules="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +" # remove node_modules recursivamente

# some git shortcuts
alias gti="echo \"✨ gti is an alias to: git\" && git"
alias g="echo \"✨ g is an alias to: git\" && git"
alias gs="echo \"✨ gs is an alias to: git status\" && git status"
alias gl="echo \"✨ gl is an alias to: git log\" && git log"
alias glg="echo \"✨ gl is an alias to: git log --oneline --graph\" && git log --oneline --graph"
alias gc="echo \"✨ gc is an alias to: git commit\" && git commit"
alias ga="echo \"✨ ga is an alias to: git add\" && git add"
alias gaa="echo \"✨ gaa is an alias to: git add -A\" && git add -A"
alias gb="echo \"✨ gb is an alias to: git branch\" && git branch"
alias gco="echo \"✨ gco is an alias to: git checkout\" && git checkout"
alias gcom="echo \"✨ gcom is an alias to: git checkout master\" && git checkout master"
alias gsw="echo \"✨ gsw is an alias to: git switch\" && git switch"
alias gacm="echo \"✨ gacm is an alias to: git add -A && git commit -m\" && git add -A && git commit -m"
alias gaca="echo \"✨ gaca is an alias to: git add -A && git commit --amend --no-edit\" && git add -A && git commit --amend --no-edit"
alias gprm="echo \"✨ gprm is an alias to: git pull --rebase origin master\" && git pull --rebase origin master"
alias gprmaster="echo \"✨ gprm is an alias to: git pull --rebase origin master\" && git pull --rebase origin master"
alias gprmain="echo \"✨ gprm is an alias to: git pull --rebase origin main\" && git pull --rebase origin main"
alias gpfwl="echo \"✨ gpfwl is an alias to: git push --force-with-lease\" && git push --force-with-lease"
alias gitupdatemaster="echo \"✨ gitupdatemaster is an alias to: git switch master && git pull && git switch -\" && git switch master && git pull && git switch -"
alias gitcleanup="echo \"✨ gitcleanup is an alias to: git branch | grep -v "master" | xargs git branch -D\" && git branch | grep -v "master" | xargs git branch -D"

# why your mac is so slow?
alias top="top -o vsize"

alias docker-mongodb="docker run --name mongodb -d -p 27017:27017 -v ~/Developer/data mongo"
alias docker-mongodb-exec="docker exec -it mongodb bash -c \"mongo\""
alias docker-prune-every-fucking-thing="docker system prune --all --volumes"
