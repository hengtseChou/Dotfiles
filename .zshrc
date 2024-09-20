#             _
#     _______| |__  _ __ ___
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__
#  (_)___|___/_| |_|_|  \___|

# -----------------------------------------------------
# PATH
# -----------------------------------------------------

export PATH="/usr/lib/ccache/bin/:$PATH"
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

# -----------------------------------------------------
# ZSH
# -----------------------------------------------------

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
    ohmyzsh-full-autoupdate
)
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gcheck="git checkout"
alias gb="git branch"
alias gsw="git switch"
alias gd="git diff"
alias gcl="git clone"

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias e="exit"
alias search="s -p google"
alias wifi="nmtui connect"
alias clock="peaclock"
alias dots="code $HOME/Dotfiles"
alias nf="neofetch"
alias ff="fastfetch"
alias edit="gnome-text-editor"
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias lt="eza --tree --level=1 --icons --group-directories-first"
alias mirrors="rate-mirrors --allow-root --protocol https arch | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist"
alias zshrc="nano $HOME/.zshrc"
alias reload="source $HOME/.zshrc"
alias inst="sudo pacman -S"
alias uninst="sudo pacman -Rns"

# -----------------------------------------------------
# PYWAL
# -----------------------------------------------------

cat $HOME/Dotfiles/sequences

# -----------------------------------------------------
# STARSHIP
# -----------------------------------------------------

eval "$(starship init zsh)"

# -----------------------------------------------------
# ZOXIDE
# -----------------------------------------------------

eval "$(zoxide init zsh)"

# -----------------------------------------------------
# PYENV
# -----------------------------------------------------

eval "$(pyenv init -)"
export PY3_10="$HOME/.pyenv/versions/3.10.14/bin/python3.10"

# -----------------------------------------------------
# MISCS
# -----------------------------------------------------

setopt no_nomatch
