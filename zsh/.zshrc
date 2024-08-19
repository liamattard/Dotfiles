# --------------------------------------------------------
#                   Liam's .zshrc
# --------------------------------------------------------

# ZINIT Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"


# Install and configure oh-my-posh if not already installed
if ! command -v oh-my-posh &> /dev/null; then
    echo "oh-my-posh not found. Installing..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# Oh-My-Posh Theme
THEME="~/Dotfiles/zsh/oh_my_posh/catppuccin.omp.json"

eval "$(oh-my-posh init zsh --config $THEME)"

# Set options for history
setopt histignorealldups sharehistory appendhistory hist_ignore_space
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTFILE
HISTDUP=erase

if [[ "$WORK_OR_PERSONAL" == "WORK" ]]; then
    . /home/attardl/scripts/ilmt.sh
    . /home/attardl/scripts/mq.sh
    . /home/attardl/scripts/mq-farm.sh

    alias git-bash='/mnt/c/Program\ Files/Git/bin/bash.exe'
else
    alias vim=nvim
fi

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load custom scripts
. ~/Dotfiles/zsh/vim_mode.sh
. ~/Dotfiles/zsh/completion.sh

# Key bindings
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey '^ ' autosuggest-accept
