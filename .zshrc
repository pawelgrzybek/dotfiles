# 0 Black
# 1 Red
# 2 Green
# 3 Yellow
# 4 Blue
# 5 Magenta
# 6 Cyan
# 7 White
# 8 Black (bright)
# 9 Red (bright)
# 10 Green (bright)
# 11 Yellow (bright)
# 12 Blue (bright)
# 13 Magenta (bright)
# 14 Cyan (bright)
# 15 White (bright)


# Gathering information from version control systems
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information
setopt PROMPT_SUBST
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' %B%F{2}[+]%f%b' # styling for %c
zstyle ':vcs_info:*' unstagedstr ' %B%F{1}[-]%f%b' # styling for %u
zstyle ':vcs_info:*' patch-format ' %B%F{1}[%])%f%b' # styling for %m
#                                             👆
# I am not sure about thi %p but it is hard to test, so
# i am waiting until i come across situation to test it in real life
# zstyle ':vcs_info:*' patch-format '%B%F{1} (rebase)%f%b' # styling for %m
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' formats "%F{3}%r:%b%f%c%u%m"
# zstyle ':vcs_info:git:*' actionformats "%F{3}%r:%b#$(git rev-parse --short HEAD)%f%c%u%m "

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]=' %B%F{6}[•]%f%b'
  fi
}


# Hook Functions
# http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
precmd () {
  vcs_info
}

chpwd () {
  if [ -f .nvmrc ]; then
    echo "· · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·"
    echo ""
    pnpm env use --global $(cat .nvmrc)
    echo ""
    echo "· · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·"
  fi;
}


# Changing directories
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
setopt AUTO_CD


# History
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Completion System
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Completion-System
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

PROMPT='%U%F{4}%~%f%u '
RPROMPT='${vcs_info_msg_0_}'

# Additional aliases/utils
source ~/.dotfiles/.zshrc-aliases.sh
source ~/.dotfiles/.zshrc-utils.sh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# pnpm
export PNPM_HOME="/Users/pawelgrzybek/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source /Users/pawelgrzybek/.config/broot/launcher/bash/br
