# add stuff to command line
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=${PATH}:/usr/local/mysql/bin/

# remove computer name from beginig on command line
# More about it:
# http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
export PS1="$ "

# android environment variable
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# easier folders navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though

# utility shortcuts improved
alias ls="ls -F" # show trailing slash with folders
alias ll="ls -la" # show list of all files (including hidden)

# some git shortcuts
alias g="git"
alias gs="git status"
alias gl="git log --graph --oneline --all --decorate"
alias gc="git commit"
alias ga="git add -A"
alias gb="git branch"
alias gco="git checkout"
alias gacm="git add -A && git commit -m"

# show / hide hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles YES ; killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles NO ; killall Finder"

# why your mac is so slow?
alias top="top -o vsize"

# run a dead simple python server
alias serve="echo 'Your cool server is runing on http://localhost:8000/' && open http://localhost:8000/ && python -m SimpleHTTPServer 8000"
alias servephp="echo 'Your cool server is runing on http://localhost:8000/' && open http://localhost:8000/ && php -S 0.0.0.0:8000 -t ."

# go to projects folder
alias projects="cd /Applications/MAMP/htdocs/"

# sudo autocomplete
complete -cf sudo
