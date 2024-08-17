# --------------------------------------------------------
#                   Liam's .zshrc
# --------------------------------------------------------


# Set options for history
setopt histignorealldups sharehistory
HISTFILE=~/.zsh_history

# Aliases
alias vim=nvim

# Key bindings
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Load custom scripts
. ~/Dotfiles/zsh/vim_mode.sh
. ~/Dotfiles/zsh/completion.sh

# Install and configure oh-my-posh if not already installed
if ! command -v oh-my-posh &> /dev/null; then
    echo "oh-my-posh not found. Installing..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
fi

THEME="~/Dotfiles/zsh/oh_my_posh/catppuccin.omp.json"
eval "$(oh-my-posh init zsh --config $THEME)"

if [[ "$WORK_OR_PERSONAL" == "WORK" ]]; then
    . /home/attardl/scripts/ilmt.sh
    . /home/attardl/scripts/mq.sh
    . /home/attardl/scripts/mq-farm.sh
fi
