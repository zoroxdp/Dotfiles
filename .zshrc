# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xiong-chiamiov-plus"

plugins=( git sudo zsh-autosuggestions zsh-syntax-highlighting )


source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

export EDITOR=nvim
export VISUAL=nvim

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias leetcode="nvim leetcode.nvim"
alias pn="pnpm"
alias pnx="pnpx"
alias lg="lazygit"
alias ld="lazydocker"
alias f="fzf --preview='bat --color=always {}' --bind ctrl-p:preview-page-up,ctrl-n:preview-page-down"
alias fn='nvim "$(f)"'
alias t="tmux"
alias ta='tmux attach -t'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

function jj() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
alias j="jj && clear"

neofetch

export PATH=$PATH:/home/dp/.spicetify
eval "$(zoxide init zsh)"
#screenfetch
#fastfetch
