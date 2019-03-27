#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ..='cd ..'
alias up='cd ..'
alias diff='colordiff'              # requires colordiff package
alias df='df -h'
alias du='du -c -h'
alias du1='du --max-depth=1'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -p -v'

alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

alias fm='~/.config/vifm/scripts/start-vifm.sh'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'

# pacman aliases
alias pac="sudo pacmatic -S"      # default action     - install one or more packages
alias pacu="sudo pacmatic -Syu"   # '[u]pdate'         - upgrade all packages to their newest version
alias pacs="pacmatic -Ss"         # '[s]earch'         - search for a package using one or more keywords
alias paci="pacmatic -Si"         # '[i]nfo'           - show information about a package
alias pacr="sudo pacmatic -R"     # '[r]emove'         - uninstall one or more packages
alias pacl="pacmatic -Sl"         # '[l]ist'           - list all packages of a repository
alias pacll="pacmatic -Qqm"       # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
alias paclo="pacmatic -Qdt"       # '[l]ist [o]rphans' - list all packages which are orphaned
alias paco="pacmatic -Qo"         # '[o]wner'          - determine which package owns a given file
alias pacf="pacmatic -Ql"         # '[f]iles'          - list all files installed by a given package
alias pacc="sudo pacmatic -Sc"    # '[c]lean cache'    - delete all not currently installed package files
alias pacm="makepkg -fci"         # '[m]ake'           - make package from PKGBUILD file in current directory
alias pacle="pacmatic -Qqe"       # '[l]ist [e]xplicit'   - list all installed packages

# copy and go to dir
# Use: cpg file.txt /path/to/dir
cpg (){
    if [ -d "$2" ];then
        cp $1 $2 && cd $2
    else
        cp $1 $2
    fi
}

# move and go to dir
# use: mvg file.txt /path/to/dir
mvg (){
    if [ -d "$2" ];then
        mv $1 $2 && cd $2
    else
        mv $1 $2
    fi
}

# find a file with pattern in name
# Use: findit stringToSearchFor
# Note: findit function is NOT case-sensitive
findit (){
    if [ -z ${1} ];then
        echo "Please pass an argument that you want to search for"
    else
        find . -iname "*$1*" -print
    fi
}

# Creates a backup of the file passed as
# parameter with the date and time
function bak() { cp "$1" "$1-`date +%Y%m%d-%H%M%S`" ; }

PS1='[\u@\h \W]\$ '

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\n\[\033[0;32m\]\u@\h \[\033[0;34m\]\w\[\033[0;33m\]\$(parse_git_branch)\[\033[0m\]\n\[\033[0;33m\]\t\[\033[0;30m\] \$ "

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jo/.sdkman"
[[ -s "/home/jo/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jo/.sdkman/bin/sdkman-init.sh"
