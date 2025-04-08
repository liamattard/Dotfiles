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

setopt appendhistory         # Append new commands to history file instead of overwriting
setopt inc_append_history    # Immediately add commands to history instead of waiting until shell exit
setopt histignorealldups     # Remove duplicate commands from history
setopt hist_ignore_space     # Ignore commands that start with a space
setopt sharehistory          # Share history between multiple Zsh sessions
setopt extended_history      # Save timestamps and execution duration in history
setopt hist_verify           # Don’t execute immediately when recalling history, allow editing first
setopt hist_expire_dups_first # Remove older duplicate commands first when reaching HISTSIZE limit
setopt hist_save_no_dups     # Don’t save duplicate lines in the history file
# Set options for history
#setopt histignorealldups sharehistory appendhistory hist_ignore_space
#HISTFILE=/home/attardl/.zsh_history
HISTFILE=~/.zsh_history
SAVEHIST=1000
HISTSIZE=5000
#HISTDUP=erase

if [[ "$WORK_OR_PERSONAL" == "WORK" ]]; then
    . /home/attardl/scripts/ilmt.sh
    . /home/attardl/scripts/mq.sh
    . /home/attardl/scripts/mq-farm.sh

    alias git-bash='/mnt/c/Program\ Files/Git/bin/bash.exe'
    PATH=$PATH:/home/attardl/shellcheck-stable
else
    alias vim=nvim
fi

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load custom scripts
. ~/Dotfiles/zsh/vim_mode.sh
#. ~/Dotfiles/zsh/completion.sh

# Key bindings
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey '^ ' autosuggest-accept

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/attardl/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/attardl/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/attardl/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/attardl/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/miniconda3/bin/activate

