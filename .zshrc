if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=1000
SAVEHIST=1000

set -o emacs

# fzf must be placed after emacs settings or C-T won't work in tmux
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"

zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "yukiycino-dotfiles/fancy-ctrl-z"

zplug load

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

setopt correct # Command correction
setopt auto_pushd # Enables cd -TAB completion

setopt globdots # Hidden files tab completion

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

export MAKEFLAGS="-j$(sysctl -n hw.logicalcpu)"

export FZF_DEFAULT_COMMAND='fd --type f --follow --color=always --exclude .git'
export FZF_DEFAULT_OPTS="--ansi --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || nvim {} || tree -C {}) 2> /dev/null | head -200'"

export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:$HOME/.bin

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

alias y='yarn'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sv='sudo -E nvim'
alias v.="nvim ."
alias j="just"
alias emacs='emacs -nw'
alias dc='docker-compose'
alias please='sudo'
alias fuck='pkill -9'
alias rsync='rsync -avh --info=progress2'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lal='exa -la'
alias rg="rg"
alias grep="rg"
alias find="fd"
alias f="fd"
alias g="git"
alias t="tmux"
alias :q="exit"
alias m="make"
alias j="just"

# Tmux related
alias td="tmux detach"
alias ta="tmux attach"
alias tn="tmux new"

# Git related
alias gt1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gt2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

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
