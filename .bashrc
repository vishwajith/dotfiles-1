# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi



################
# Personalized #
################

# Don't show these commands in the history
export HISTIGNORE=ls:fg:q

PS1="\[\033[1;34m\]\w\[\033[0m\] \$ "

# Navigation
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Rubygems, npm (node package manager), Cabal (Haskell packet manager)
PATH=$PATH:/var/lib/gems/1.8/bin:$HOME/node_modules/.bin:$HOME/.cabal/bin

# Use $HOME/bin
PATH=$PATH:$HOME/bin

# Use $HOME/dotfiles/bin
[[ -d "$HOME/dotfiles/bin" ]] && PATH=$PATH:$HOME/dotfiles/bin

# Notify that a command has finished with "command -t hat --takes=longtime; alert"
# source: http://linuxundich.de/de/ubuntu/benachrichtigungen-beim-beenden-langwieriger-prozesse/
if [ -x /usr/bin/notify-send ]; then
  alias alert='notify-send -i gnome-terminal "[$?] $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/;\s*alert$//'\'')"'
fi

# Vi mode
set -o vi

# One letter aliases
alias q='exit'
alias v='vim'
alias l='less'
alias ..='cd ..'

# tmux with 256 colors
alias tmux='tmux -2'

# Open vim and NERDTree
alias vimt='vim -c "NERDTree"'

# Move files to trash instead of deleting them (uses trash-cli)
alias rm='trash-put'

# 256 colors
export TERM='xterm-256color'

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

fortune -s | cowsay
echo "" # empty line

# High Level Assembler needs this
# http://homepage.mac.com/randyhyde/webster.cs.ucr.edu/HighLevelAsm/HLADoc/HLARef/HLARef_pdf/03_InstallingHLA.pdf
export hlalib=/usr/hla/hlalib
export hlainc=/usr/hla/include
export hlatemp=/tmp

# Git Aliases
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
