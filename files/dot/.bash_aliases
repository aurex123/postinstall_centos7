if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi


alias cda='cd /var/www/admision.uan.mx'
alias cdat='cd /var/www/admisiontest.uan.mx'

alias rm='rm -f'
alias cp='cp -f'
alias mv='mv -f'

__has_parent_dir () {
    # Utility function so we can test for things like .git/.hg without firing up a
    # separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo "-[svn]";
    elif __has_parent_dir ".git"; then
        echo "-[$(__git_ps1 'git %s')]";
    elif __has_parent_dir ".hg"; then
        echo "-[hg $(hg branch)]"
    fi
}

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# Nicely formatted terminal prompt
export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[$reset\]\n\[$reset\]\$ '
# -----------------------------------------------
#   Aliases
# -----------------------------------------------
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

alias ll='ls -lAFh --color=tty --group-directories-first'   # long list
alias ld='ll -lAFh | grep --color=never "^d"'             # solo Carpetas

alias ls='ls -AF --color=always'
alias dir='dir -F --color=always'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -iv'
alias grep='grep --color=auto -in'
alias ..='cd ..'


# Crea nueva carpeta y se le mete
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Easily re-execute the last history command.
alias r="fc -s"

alias l='less '
alias h='history |grep'
alias b='sudo find / -name'

# Desactiva un servicio
function desactiva() {
    sudo chkconfig "$@" off
    sudo service "$@" stop
}

alias vi='vim'
# Para que al hacer sudo vi tambien expanda el alias del vi a vim (notese el espacio al final del sudo)
alias sudo='sudo '

# Reinicia un servicio
function reinicia() {
    sudo service "$@" restart
}


# -----------------------------------------------
# Git shortcuts

alias g='git'
alias gp='git push'
alias gu='git pull'
alias gpush='git push'
alias gpull='git pull'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias glog='gl'
alias gg='git log --decorate --oneline --graph --date-order --all'
alias gst='gs'
alias gdc='gd --cached'
alias gm='git commit -m'
alias gca='git commit -am'
alias gba='git branch -a'
function gco() { git checkout "${@:-master}"; } # Checkout master by default
#alias gco='go'
alias gcb='gc -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gcl='git clone'


# GIT aliases
# --------------------
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '


# Docker aliases
# ---------------------
alias d='docker '
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dc='docker-compose'
function dexec {
    docker exec -i -t $1 /bin/bash
}
function drm () {
    docker stop $1 && docker rm $1
}



# -----------------------------------------------
#   History settings
# -----------------------------------------------

# Allow use to re-edit a faild history substitution.
shopt -s histreedit
# History expansions will be verified before execution.
shopt -s histverify

# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
export HISTCONTROL="ignorespace:erasedups"
# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "
# Lots o' history.
export HISTSIZE=10000
export HISTFILESIZE=10000



# -----------------------------------------------
#   Varios
# -----------------------------------------------

export GREP_OPTIONS='--color=auto'

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh
fi