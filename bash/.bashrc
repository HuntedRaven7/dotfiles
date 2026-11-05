# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
# if [ -d ~/.bashrc.d ]; then
#   for rc in ~/.bashrc.d/*; do
#     if [ -f "$rc" ]; then
#       . "$rc"
#     fi
#   done
# fi
unset rc

eval "$(atuin init bash --disable-up-arrow)"

export BAT_THEME=ansi
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

eval "$(starship init bash)"

if command -v mise &> /dev/null; then
  eval "$(mise activate bash)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias eff='$EDITOR "$(ff)"'

if command -v zoxide &> /dev/null; then
  alias cd="zd"
  zd() {
    if (( $# == 0 )); then
      builtin cd ~ || return
    elif [[ -d $1 ]]; then
      builtin cd "$1" || return
    else
      if ! z "$@"; then
        echo "Error: Directory not found"
        return 1
      fi

      printf "\U000F17A9 "
      pwd
    fi
  }
fi

export EDITOR=nvim
export SUDO_EDITOR=nvim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias t='tmux attach || tmux new -s Work'
alias ic='tdl c'
alias ix='tdl cx'
alias icx='tdl c cx'
alias mup='MISE_MINIMUM_RELEASE_AGE=0 mise up'

alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias gs="git status"
alias ga="git add"
alias gpl="git pull"
alias gp="git push"
alias lg="lazygit"

alias fpu='flatpak update'

alias c='clear'
alias nf='fastfetch'
alias pf='fastfetch'

alias shutdown='systemctl poweroff'

alias v='$EDITOR'
alias vi='$EDITOR'
alias vim='$EDITOR'
