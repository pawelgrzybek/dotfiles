# Preferred editor
export EDITOR="vim"

# ZSH prompt

# Load vcs_info function
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Gathering-information-from-version-control-systems
autoload -Uz vcs_info

# Hook Functions
# http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
# Executed before each prompt
precmd () {
  # Add vsc_info to executed before each prompt
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  vcs_info
}

# Executed whenever the current working directory is changed
chpwd () {
  # Install node using nvm when .nvmrc config file exists in a directory
  if [ -f .nvmrc ]; then
    echo "· · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·"
    echo ""
    nvm use
    echo ""
    echo "· · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·"
  fi;
}

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
# http://zsh.sourceforge.net/Doc/Release/Options.html#Prompting
setopt PROMPT_SUBST

# Enable git only (i don't use anything else)
# Enable info about uncommited changes in working directory
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Quickstart
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%F{black} (dirty)%f" # styling for %u
zstyle ':vcs_info:*' stagedstr "%F{black} (staged files)%f" # styling for %c
zstyle ':vcs_info:*' patch-format "%F{black} (rebase)%f" # styling for %m

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Format vsc info message
zstyle ':vcs_info:git:*' formats "%F{yellow}%r → %b%F{black}%u%c%m%f%f "
zstyle ':vcs_info:git:*' actionformats "%F{yellow}%r → %b%F{black}%u%c%m%f%f "


+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{black} (untracked files)%f'
  fi

}


prompt() {
  if [ -d .git ]; then
    echo ${vcs_info_msg_0_}
  else
    echo '%F{yellow}%3~%f '
  fi;
}

rprompt() {
  echo '%F{white}%n, %*%f'
}

PROMPT='$(prompt)'
RPROMPT='$(rprompt)'

# ZSH auto cd
setopt AUTO_CD

# ZSH history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# ZSH case insensitive path-completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Set personal aliases

# utility shortcuts improved
alias mv="mv -iv" # safer and verbose move
alias cp="cp -riv" # safer, resursive and verbose copy
alias mkdir='mkdir -vp' # verbose mkdir that allows to pass a path
alias ls="ls -F" # show trailing slash with folders
alias ll="ls -la" # show list of all files (including hidden)
alias yolo="brew upgrade && yarn global upgrade --latest" # upgrade every-fuckin-thing
alias byebye_node_modules="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +" # remove node_modules recursivamente

# some git shortcuts
alias gti="echo \"✨ gti is an alias to: git\" && git"
alias g="echo \"✨ g is an alias to: git\" && git"
alias gs="echo \"✨ gs is an alias to: git status\" && git status"
alias gl="echo \"✨ gl is an alias to: git log\" && git log"
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

# nvm setup
# command provided post brew install nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Go
export GOPATH=$HOME/Developer/go

function optim() {
  # For this one to run you need to install a few CLIs
  # brew install webp
  # yarn global add avif
  # yarn global add imageoptim-cli

  dirPath=$(pwd)
  filePath=$dirPath/$1
  fileName=$filePath:t:r
  fileExtension=$filePath:t:e
  filePathWebp="${filePath/.${fileExtension}/".webp"}"

  echo -e "\033[0;34mi Running cwebp...\033[0m"
  cwebp -quiet $filePath -o $filePathWebp

  echo -e "\033[0;34mi Running avif...\033[0m"
  npx avif --input="$filePath"

  imageoptim --no-stats $filePath

  echo "✅ ${fileName}.webp generated"
  echo "✅ ${fileName}.avif generated"
  echo "✅ ${fileName}.${fileExtension} optimized"
}

alias python=python3
