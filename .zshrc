# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/Dion/.zshrc'


# Load my scripts
path+=('/home/Dion/.bin')
path=('/home/Dion/.bin' $path)
export PATH

# Autoload
autoload -Uz compinit promptinit colors
compinit        # Autocompletion
promptinit      # Advanced prompt support
colors          # Prompt colors

# New line before prompt
precmd() { print "" }

# Prompt
PROMPT="%{$fg_bold[foreground]%}>>>%{$reset_color%} %{$fg_bold[blue]%}%~%{$reset_color%} "
zle_highlight=(default:fg=foreground)

# New line after command
preexec() { print "" }

# Window title
case $TERM in
    (*xterm* | rxvt)
      function precmd {
          print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
      }
      function preexec {
          printf "\033]0;%s\a" "$1"
      }
    ;;
esac

# Bindkeys
bindkey "^[[7~" beginning-of-line     # Home
bindkey "^[[8~" end-of-line           # End
bindkey "^[[3~" delete-char           # Del
bindkey "^[Oa"  beginning-of-line     # ctrl + Up
bindkey "^[Ob"  end-of-line           # ctrl + Down
bindkey "^[Oc"  forward-word          # ctrl + Right
bindkey "^[Od"  backward-word         # ctrl + Left
bindkey "^H"    backward-delete-word  # ctrl + Backspace
bindkey "^[[3^" delete-word           # ctrl + Del

# Files
alias ls="ls --color=auto"
alias lsh="ls -d .[^.]*"
alias cp="cp -v -i"
alias rm="rm -v -i"
alias mv="mv -v -i"
alias mkdir="mkdir -v -p"
alias chmod="chmod -v"
alias chown="chown -v"
alias ln="ln -v"

# HDD space
alias df="df -h"
alias du="du -c -h"

# Power
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"

# Change directory
alias home="cd ~"
alias dl="cd ~/Downloads/"
alias back="cd -"
alias up="cd .."
alias battery="cat /sys/class/power_supply/BAT0/capacity"
alias bin="cd ~/.bin"

# Programs
alias nano="nano -w"
alias nanoc="nano -Y conf"
alias grep="grep --color=auto"

# Git dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Zsh bug puts command line in the middle :( - clear fixes that
clear

# Fun colored boxes
for i in {0..7}; do echo -en "\e[0;3${i}m▉▉▉▉▉▉▉▉▉▉▉\e[0m "; done; echo
