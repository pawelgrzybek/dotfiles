# Extend path
export PATH="/usr/local/sbin:$PATH"

# Preferred editor
export EDITOR="vim"

# ZSH prompt
# PROMPT='%F{yellow}%3~%f '
# RPROMPT='%F{242}%n, %D, %*%f'





# Load vcs_info function
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Gathering-information-from-version-control-systems
autoload -Uz vcs_info

# Add vsc_info to executed before each prompt
# http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
precmd () { vcs_info }

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
# http://zsh.sourceforge.net/Doc/Release/Options.html#Prompting
setopt PROMPT_SUBST

# Enable git only (i don't use anything else)
# Enable info about uncommited changes in working directory
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Quickstart
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

# Format vsc info message
# zstyle ':vcs_info:git:*' formats "%F{yellow}%r > %b%f vcs: %F{yellow}%s%f | branch: %b | repo: %r | stagedstr: %c | unstagedstr: %u"
zstyle ':vcs_info:git:*' formats "%F{242}· %r > %b%f "

PROMPT='%F{yellow}%3~%f ${vcs_info_msg_0_}'
RPROMPT='%F{242}%n, %D, %*%f'





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
alias ls="ls -F" # show trailing slash with folders
alias ll="ls -la" # show list of all files (including hidden)
alias yolo="brew upgrade && brew cask upgrade && yarn global upgrade --latest" # upgrade everything

# some git shortcuts
alias g="git"
alias gs="git status"
alias gl="git log --graph --oneline --all --decorate"
alias gc="git commit"
alias ga="git add -A"
alias gb="git branch"
alias gco="git checkout"
alias gacm="git add -A && git commit -m"
alias gprm="git pull --rebase origin master"
alias gpfwl="git push --force-with-lease"

# why your mac is so slow?
alias top="top -o vsize"

# run a dead simple python server
alias serve="echo 'Your cool server is runing on http://localhost:8000/' && open http://localhost:8000/ && python -m SimpleHTTPServer 8000"
alias servephp="echo 'Your cool server is runing on http://localhost:8000/' && open http://localhost:8000/ && php -S 0.0.0.0:8000 -t ."

# nvm setup
# command provided post brew install nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
