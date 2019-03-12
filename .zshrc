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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_OS_ICON_FOREGROUND="108"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

# Plugins
if [ "$TERM" != 'linux' ]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
else 
  export PS1="%{%F{yellow}%}%n%{%f%} %~ › "
fi
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "yukiycino-dotfiles/fancy-ctrl-z"

# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt correct # Command correction


setopt globdots # Hidden files tab completion

stty -ixon # Disables XON/XOFF flow control

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'; # Tab colors

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
autoload -Uz compinit && compinit -i

source /usr/share/nvm/init-nvm.sh # Set up Node Version Manager

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export ANDROID_HOME=${HOME}/Android/Sdk 
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fixes grey java apps
export PATH=${PATH}:${HOME}/.bin
export PATH=${PATH}:${ANDROID_HOME}/emulator 
export PATH=${PATH}:${ANDROID_HOME}/tools 
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/root/.gem/ruby/2.4.0/bin
export PATH=${PATH}:${HOME}/.yarn/bin
export PATH=${PATH}:/opt/drush/drush:/usr/local/bin/drush
export PATH=${PATH}:/opt/mongodb/bin
export PATH=${PATH}:${JAVA_HOME}/bin:$PATH
export PATH=${PATH}:${HOME}/.cargo/bin

export FZF_DEFAULT_COMMAND='fd --type f --follow --color=always --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export _JAVA_OPTIONS=-Djava.io.tmpdir=/var/tmp
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

# Shortcuts
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sv='sudo -E nvim'
alias emacs='emacs -nw'
alias bc='bc -ql'
alias tb='taskbook'
alias please='sudo'
alias fuck='killall -9'
alias ag='ag --path-to-ignore ~/.ignore'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lal='exa -la'
alias cal='cal -m'
alias ra='ranger'
alias rago='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"' # cd to closed directory
alias scrot='scrot -q 100 ~/Pictures/screenshots/%Y-%m-%d-%T-screenshot.png'
alias rndbg='adb shell input keyevent 82'
alias grep="rg"
alias find="fd"
alias f="fd"

# Kitty related
alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"
alias nf="neofetch --kitty ~/.config/neofetch/image/"

# Tmux related
alias td="tmux detach"
alias ta="tmux attach"
alias tn="tmux new"

# Git related
alias gt1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gt2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

