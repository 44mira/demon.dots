# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light softmoth/zsh-vim-mode

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -v  
KEYTIMEOUT=1

# History
HISTSIZE=5000                 # how many commands to track in history
HISTFILE=~/.zsh_history       # where to save history
SAVEHIST=$HISTSIZE            # how many to save history
HISTDUP=erase                 # what to do to duplicates
setopt appendhistory          # append to history file instead of replacing
setopt sharehistory           # share history across all sessions
setopt hist_ignore_space      # ignore commands prefixed with space
setopt hist_ignore_all_dups   # ignore duplicate commands
setopt hist_save_no_dups      # ..
setopt hist_ignore_dups       # ..
setopt hist_find_no_dups      # ..

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'                        # case-insensitive match
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# function yy() {
# 	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
# 	yazi "$@" --cwd-file="$tmp"
# 	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
# 		cd -- "$cwd"
# 	fi
# 	rm -f -- "$tmp"
# }
alias yy=yazi

# bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

alias nv="nvim"
alias py="python"
alias ls="exa"
alias op="xdg-open"
alias ll="exa -s type -l"
alias ff="fastfetch"
alias lg="lazygit"
alias ldc="lazydocker"

# erlang and elixir
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init - zsh)"

path+=("${HOME}/.local/share/gem/ruby/3.3.0/bin")
path+=("${HOME}/.local/bin")
path+=("${HOME}/go/bin")
path+=("${HOME}/.cargo/bin")
export PATH

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(uv generate-shell-completion zsh)"

[ -f "/home/mira/.ghcup/env" ] && . "/home/mira/.ghcup/env" # ghcup-env


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/mira/.opam/opam-init/init.zsh' ]] || source '/home/mira/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

