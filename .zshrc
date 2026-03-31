source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="ls --color=auto"
alias vim="nvim"

eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"

