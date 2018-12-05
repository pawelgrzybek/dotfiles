# add stuff to command line
export PATH=${PATH}:/usr/local/mysql/bin

# remove computer name from beginig on command line
# More about it:
# http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
export PS1="$ "

# use vim as a default command line editor
export EDITOR="vim"

# enable bash autocompletion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# easier folders navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

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
alias gprm="git pull --rebase origin master"

# why your mac is so slow?
alias top="top -o vsize"

# run a dead simple python server
alias serve="echo 'Your cool server is runing on http://localhost:8000/' && open http://localhost:8000/ && python -m SimpleHTTPServer 8000"
alias servephp="echo 'Your cool server is runing on http://localhost:8000/' && open http://localhost:8000/ && php -S 0.0.0.0:8000 -t ."

# start / stop apache & MySQL
alias am-start="sudo apachectl start && mysql.server start"
alias am-stop="sudo apachectl stop && mysql.server stop"

# npm shit
alias npmi="npx benny-hill npm i"
alias npmu="npx benny-hill npm u"
alias npmt="npx benny-hill npm t"

# sudo autocomplete
complete -cf sudo

# enable nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
