# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Alias vim for nvim
alias vim='nvim'
alias nvim='env PATH=/home/soles/Desktop/apptainer/ros2-environment:$PATH nvim'
alias ytop='bpytop'
alias cat='bat'
alias fzf="fzf | xargs nvim -"
alias vimdiff='nvim -d'

# Start tmux on login
if [[ -z "$TMUX" ]] && [[ "$TERM" != "screen" ]] && [[ "$TERM" != "tmux" ]]; then
  tmux
fi

source $HOME/.zsh_fzfrc
