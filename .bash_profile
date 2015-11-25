# add a subl command to command line
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin

# remove computer name from beginig on command line
export PS1="\u$ "

# easier folders navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though

# some git shortcuts
alias g="git"
alias gs="git status"
alias gl="git log --graph --oneline --all --decorate"
alias gc="git commit"
alias ga="git add ."

# show / hide hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles YES ; killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles NO ; killall Finder"

# use tree . or tree some/path to print tree view
function tree {
  find ${1:-.} -print | sed -e 's;[^/]*/;|__;g;s;__|; |;g'
}
