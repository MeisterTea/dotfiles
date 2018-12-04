source /usr/share/zsh/scripts/zplug/init.zsh

# Theme

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_STATUS_CROSS=true

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_BACKGROUND="yellow"
POWERLEVEL9K_TIME_FOREGROUND="black"
POWERLEVEL9K_TIME_FORMAT="%B%D{%H:%M:%S}"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv time)

POWERLEVEL9K_OS_ICON_FOREGROUND="108"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0C6'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\UE0C6'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0C7'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\UE0C7'

# Plugins

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

# Zsh parameters

# History configuration

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Command correction

setopt correct

# Hidden files tab completion

setopt globdots

# Disables XON/XOFF flow control
stty -ixon

# Tab menu

# Tab colors
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# Completion options

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

fpath=(~/.zsh/completion $fpath)
#fpath=(~/.zsh/completion/zsh-completions/src $fpath)
autoload -Uz compinit && compinit -i

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export ANDROID_HOME=${HOME}/Android/Sdk 
export SURIKAT_SETTINGS=/home/bamboozilla/.config/wildfly/crm-manager.properties
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/"
export PATH=${PATH}:${ANDROID_HOME}/tools 
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/root/.gem/ruby/2.4.0/bin
export PATH=${PATH}:${HOME}/.yarn/bin
export PATH=${PATH}:/opt/drush/drush:/usr/local/bin/drush
export PATH=${PATH}:/opt/mongodb/bin
export PATH=${PATH}:${JAVA_HOME}/bin:$PATH

export _JAVA_OPTIONS=-Djava.io.tmpdir=/var/tmp
#export TERM="xterm-256color"
export VISUAL=nvim
export EDITOR="$VISUAL"

# Fixes keys
bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line

# Enables shift tab
bindkey '^[[Z' reverse-menu-complete

# Enables emacs mode

set -o emacs

# Arrows search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases

# Tools

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Toys

alias fuck='thefuck'
alias sl='/usr/bin/sl'

# Shortcuts

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias emacs='emacs -nw'
alias bc='bc -q'
alias tb='taskbook'

# Git

alias gitTree1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gitTree2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# cd to closed directory

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
# alias ls='ls --color=auto'
alias ls='ls_extended'
alias la='ls -a'
alias ll='ls -l'

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
