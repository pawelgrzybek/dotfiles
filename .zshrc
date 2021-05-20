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
zstyle ':vcs_info:*' stagedstr "%F{242} (staged files)%f"
zstyle ':vcs_info:*' unstagedstr "%F{242} (dirty)%f"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Format vsc info message
# zstyle ':vcs_info:git:*' formats "%F{yellow}%r > %b%f vcs: %F{yellow}%s%f "
zstyle ':vcs_info:git:*' formats "%F{yellow}%r → %b%F{242}%u%c%m%f%f "


+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{242} (untracked files)%f'
  fi

}


prompt() {
  if [ -d .git ]; then
    echo ${vcs_info_msg_0_}
  else
    echo '%F{yellow}%3~%f '
  fi;
}

PROMPT='$(prompt)'
RPROMPT='%F{242}%n, %*%f'

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

# some git shortcuts
alias g="git"
alias gs="git status"
alias gl="git log --graph --oneline --all --decorate"
alias gc="git commit"
alias ga="git add"
alias gaa="git add -A"
alias gb="git branch"
alias gco="git checkout"
alias gcom="git checkout master"
alias gacm="git add -A && git commit -m"
alias gprm="git pull --rebase origin master"
alias gpfwl="git push --force-with-lease"
alias gitupdatemaster="git switch master && git pull && git switch -"
alias gitcleanup="git branch | grep -v "master" | xargs git branch -D"

# why your mac is so slow?
alias top="top -o vsize"

# run a dead simple python server
alias serve="echo 'Your cool server is runing on http://localhost:8000/' && python -m SimpleHTTPServer 8000"
alias servephp="echo 'Your cool server is runing on http://localhost:8000/' && php -S 0.0.0.0:8000 -t ."

# nvm setup
# command provided post brew install nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Go
export GOPATH=$HOME/Developer/go
