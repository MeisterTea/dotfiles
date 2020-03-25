set -o emacs
# fzf must be placed after emacs settings or C-T won't work in tmux
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


source /usr/share/zsh/scripts/zplug/init.zsh

zplug romkatv/powerlevel10k, as:theme, depth:1

# Plugins
if [ "$TERM" != 'linux' ]; then
  zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
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
setopt auto_pushd # Enables cd -TAB completion


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

export MAKEFLAGS="-j$(nproc)"
export ENABLE_FLUTTER_DESKTOP=true
export GOPATH=$HOME/go
export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fixes grey java apps
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:/opt/
export PATH=$PATH:/opt/flutter/bin/
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/tools 
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/root/.gem/ruby/2.4.0/bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$JAVA_HOME/bin:$PATH
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin/
export PATH=$PATH:$HOME/.local/bin/

export FZF_DEFAULT_COMMAND='fd --type f --follow --color=always --exclude .git'
export FZF_DEFAULT_OPTS="--ansi --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
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

function cf-widget() { cf }

zle -N cf-widget

bindkey "^f" cf-widget

# Enables shift tab
bindkey '^[[Z' reverse-menu-complete

# Arrows search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Alt backspace deletes part of path
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Aliases

# Shortcuts
alias delta='delta --theme 1337'
alias y='yarn'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sv='sudo -E nvim'
alias v.="nvim ."
alias emacs='emacs -nw'
alias dc='docker-compose'
alias bc='bc -ql'
alias please='sudo'
alias fuck='pkill -9'
alias rsync='rsync -avh --info=progress2'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lal='exa -la'
alias cal='cal -m'
alias scrot='scrot -q 100 ~/Pictures/screenshots/%Y-%m-%d-%T-screenshot.png'
alias rndbg='adb shell input keyevent 82'
alias rg="rg"
alias grep="rg"
alias find="fd"
alias f="fd"
alias g="git"
alias t="tmux"
alias tm="tmux"
alias sysd="sudo systemctl"
alias :q="exit"
alias ytop="ytop -p"

# Android related
alias reset-vending="adb shell pm clear com.android.vending"
alias logcat="adb logcat -v color"

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

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || nvim {} || tree -C {}) 2> /dev/null | head -200'"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Find in files and return filenames
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --height 40% --multi --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --pretty --context 10 '$1' || rg --pretty --context 10 '$1' {}"
}

rp() {
  sd $1 $2 $(fif $1)
}

# pierpo/fzf-docker
# doesn't work with zplug...

_fzf_complete_docker() {
  # Get all Docker commands
  #
  # Cut below "Management Commands:", then exclude "Management Commands:",
  # "Commands:" and the last line of the help. Then keep the first column and
  # delete empty lines
  DOCKER_COMMANDS=$(docker --help 2>&1 >/dev/null |
    sed -n -e '/Management Commands:/,$p' |
    grep -v "Management Commands:" |
    grep -v "Commands:" |
    grep -v 'COMMAND --help' |
    grep .
  )

  ARGS="$@"
  if [[ $ARGS == 'docker ' ]]; then
    _fzf_complete "--reverse -n 1 --height=80%" "$@" < <(
      echo $DOCKER_COMMANDS
    )
  elif [[ $ARGS == 'docker rmi'* || $ARGS == 'docker -f'* ]]; then
    _fzf_complete "--multi --reverse" "$@" < <(
      docker images --format '{{.Repository}}:{{.Tag}}'
    )
  elif [[ $ARGS == 'docker start'* || $ARGS == 'docker restart'* || $ARGS == 'docker stop'* || $ARGS == 'docker rm'* || $ARGS == 'docker exec'* || $ARGS == 'docker kill'* ]]; then
    _fzf_complete "--multi --reverse" "$@" < <(
      docker ps --format '{{.Names}}'
    )
  fi
}

_fzf_complete_docker_post() {
  # Post-process the fzf output to keep only the command name and not the explanation with it
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_docker -o default -o bashdefault docker

lps() {
  lpass show -c --password $(lpass ls -l | fzf | rg -oP '(?<=id: ).*(?=] )')
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
