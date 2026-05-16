# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gh z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$HOME/.asdf/bin:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/go/bin:$PATH"
# set -o vi
alias v=nvim
alias vf='nvim "$(fzf)"'
alias lg='lazygit'
alias lgl='lazygit log'
alias bat='batcat'
alias k=kubectl
alias kx=kubectx
alias kcuc='kubectl config unset contexts'
alias ocl='oc logout'
alias po='poetry'
alias pl=' poetry lock --no-update'
alias psh='poetry shell'
alias pi='poetry install'
alias prv='poetry run verify'
alias prs='poetry run app-start'
alias prf='poetry run format'
alias cr='clear && reset'
alias p='podman'
alias projects='cd ${PROJECTS_HOME}'
alias l='eza'
alias ll='eza -lah'

# export WHOME="/mnt/c/Users/ccl25/"
export WHOME="/mnt/c/Users/Comercial/"
export BROWSER="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
export EDITOR=nvim
export PROJECTS_HOME=${HOME}/projects

# bat as MANPAGER
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --exclude .git'
export FZF_DEFAULT_OPTS="
  --layout=reverse
  --border=rounded
  --info=inline
  --multi
  --preview='batcat {}'
  --preview-window=right:60%:wrap
  --color=bg+:#3c3836,bg:#282828,spinner:#fb4934,hl:#fabd2f
  --color=fg:#ebdbb2,header:#fb4934,info:#fabd2f,pointer:#fb4934
  --color=marker:#fb4934,fg+:#ebdbb2,prompt:#fabd2f,hl+:#fb4934
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'batcat {}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --level=2 {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down:3:hidden:wrap --bind '?:toggle-preview'"
source <(fzf --zsh) 2>/dev/null || true

# TestContainers
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock
export TESTCONTAINERS_RYUK_DISABLED=true #https://stackoverflow.com/questions/71549856/testcontainers-with-podman-in-java-tests

asdf_latest() {
  asdf plugin add $1
  asdf install $1 latest
  asdf set $1 latest
}

# Zellij utils
function zr() { zellij run --name "$*" -- zsh -ic "$*"; }
function zrf() { zellij run --name "$*" --floating -- zsh -ic "$*"; }
function zri() { zellij run --name "$*" --in-place -- zsh -ic "$*"; }
function ze() { zellij edit "$*"; }
function zef() { zellij edit --floating "$*"; }
function zei() { zellij edit --in-place "$*"; }
function zpipe() {
  if [ -z "$1" ]; then
    zellij pipe
  else
    zellij pipe -p $1
  fi
}

function pg() {
  if [ ! -f $1 ]; then
    touch $1
  fi
  zri poetry run nvim $1 && zrf poetry run streamlit run $1 --server.headless True --theme.base "light" --browser.gatherUsageStats False --server.runOnSave True --server.port 8501
}

eval "$(direnv hook zsh)"

# eval "$(zellij setup --generate-auto-start zsh)"
if [[ -z "$ZELLIJ" ]]; then
  if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
    zellij attach -c
  else
    exec zellij -l welcome
  fi
  if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
    exit
  fi
fi


# Added by dbt Fusion extension (ensure dbt binary dir on PATH)
if [[ ":$PATH:" != *":/home/cristian/.local/bin:"* ]]; then
  export PATH=/home/cristian/.local/bin:"$PATH"
fi

# Added by dbt Fusion extension
alias dbtf=/home/cristian/.local/bin/dbt
