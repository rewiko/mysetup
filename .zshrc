# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"
#ZSH_THEME="mh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# remove CTRL-U kill all line and just remove from the cursor to the beginning 
bindkey \^U backward-kill-line

bindkey '^[[Z' reverse-menu-complete

if [[ ! $TERM =~ screen   ]]; then
#exec tmux
#        #exec tmuxinator new work
   exec tmux ls | grep : | grep session- | grep -v attached| cut -d: -f1 | xargs -I {} tmux kill-session -t {} ; tmuxinator start work -n session-$( date +"%m-%d-%Y--%H-%M-%S" )
fi

export EDITOR=vim
#alias tmux='TERM=screen-256color tmux -2'
if [ "$TERM" = "xterm"  ]; then
    export TERM=xterm-256color
fi
alias tmux='tmux -2'  # for 256color

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function pcheat() {
  cd ~/.cheat/personal/
  git pull
  cd -
  cd ~/.cheat/community/
  git pull
  cd -
}

function sync_cheat() {
  pcheat
  cd ~/.cheat/personal/
  git add .
  git commit -am 'update cheatsheet'
  git push origin master
  cd -
}

export CHEAT_CONFIG_PATH="~/.cheat/conf.yml"
alias scheat="sync_cheat"
alias sc='cheat -l | tail -n +2 | fzf | awk -v vars="$*" '"'"'{ print "cheat " $1 " " $3, vars }'"'"' | sh'
assh() {/usr/bin/ssh $(echo $1 | tr - .)}
