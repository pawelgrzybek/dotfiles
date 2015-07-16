# add a subl command to command line
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin

# remove computer name from beginig on command line
export PS1="\u$ "

#add aliases / shortcuts to command line
alias gs="git status"
alias gl="git log"
alias gc="git commit"
alias ga="git add ."

# show / hide hidden files
alias hfs="defaults write com.apple.finder AppleShowAllFiles YES ; killall Finder"
alias hfh="defaults write com.apple.finder AppleShowAllFiles NO ; killall Finder"

# use tree . or tree some/path to print tree view
function tree {
  find ${1:-.} -print | sed -e 's;[^/]*/;|__;g;s;__|; |;g'
}
