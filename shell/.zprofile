# Zsh profile

# homebrew
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# tmux-sessionizer and ready-tmux are deployed here by bootstrap
export PATH="$HOME/.local/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
command -v goenv >/dev/null && eval "$(goenv init -)"

# postgresql
[ -d /opt/homebrew/opt/postgresql@17/bin ] && export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
