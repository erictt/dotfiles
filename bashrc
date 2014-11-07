#############################################################################
# Eric's .bashrc
##############################################################################
 
if [[ $- != *i* ]] ; then
         # Shell is non-interactive.  Be done now!
         return
fi
 
#enable bash completion
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
 
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
 
# Shell variables
export PAGER=less
export EDITOR=vim
export PATH=$PATH:$HOME/bin
export LESS='-R'
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
 
if [ -d /opt/local/bin ]; then
        PATH="/opt/local/bin:$PATH"
fi
 
if [ -d /usr/lib/cw ] ; then
        PATH="/usr/lib/cw:$PATH"
fi

if [ -d /usr/local/sbin ] ; then
        PATH="/usr/local/sbin:$PATH"
fi

 
complete -cf sudo       # Tab complete for sudo
 
## shopt options
shopt -s cdspell        # This will correct minor spelling errors in a cd command.
shopt -s histappend     # Append to history rather than overwrite
shopt -s checkwinsize   # Check window after each command
shopt -s dotglob        # files beginning with . to be returned in the results of path-name expansion.
 
## set options
set -o noclobber        # prevent overwriting files with cat
set -o ignoreeof        # stops ctrl+d from logging me out
 
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
 
# Set appropriate ls alias
case $(uname -s) in
        Darwin|FreeBSD)
                alias ls="ls -hFG"
        ;;
        Linux)
                alias ls="ls --color=always -hF"
        ;;
        NetBSD|OpenBSD)
                alias ls="ls -hF"
        ;;
esac
 
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ll="ls -al"
alias cd..="cd .."
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -c'
 
alias vim='/usr/local/Cellar/macvim/7.4-73_1/MacVim.app/Contents/MacOS/Vim'
alias v='vim'

alias lsd="ls -hdlf */"

alias ssh-ll="ssh webapps@106.186.116.203"
 
# clear the shell
alias cls='clear'

# flush the dns cache
alias flushdns='dscacheutil -flushcache'

alias cd..='cd ..'
alias ~='cd ~'
alias dt='cd ~/desktop'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bye='logout'

#PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
 
##############################################################################
# Color variables
##############################################################################
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
##############################################################################
 
if [ $(id -u) -eq 0 ];
        then # you are root, set red colour prompt
                export PS1="[\[$txtred\]\u\[$txtylw\]@\[$txtrst\]mac] \[$txtgrn\]\W\[$txtrst\]# "
        else
                export PS1="\[$txtcyn\]\u\[$txtrst\]@\[$bldblu\]mac \[$txtcyn\]\W \[$txtrst\]$ "
                export SUDO_PS1="[\[$txtred\]\u\[$txtylw\]@\[$txtrst\]mac] \[$txtgrn\]\W\[$txtrst\]# "
fi
 
export GREP_OPTIONS=--color=auto
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export CLICOLOR=1
 
##############################################################################
# Functions
##############################################################################
# Delete line from known_hosts
# courtesy of rpetre from reddit
ssh-del() {
    sed -i -e ${1}d ~/.ssh/known_hosts
}
 
psgrep() {
        if [ ! -z $1 ] ; then
                echo "Grepping for processes matching $1..."
                ps aux | grep $1 | grep -v grep
        else
 
                echo "!! Need name to grep for"
        fi
}
 
# clock - a little clock that appeares in the terminal window.
# Usage: clock.
#
clock ()
{
while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}
 
# showip - show the current IP address if connected to the internet.
# Usage: showip.
#
showip ()
{
lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' 
}
 
##################
#extract files eg: ex tarball.tar#
##################
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1        ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       rar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1        ;;
            *.tbz2)      tar xjf $1      ;;
            *.tgz)       tar xzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

