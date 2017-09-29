#!/bin/zsh
#解决这个问题用Ignore insecure directories and continue [y]
# compaudit | xargs chmod g-w
function gc () {                # gc jixiuf/gamebase
    git clone https://github.com/$1
}
function gg () {                # gg jixiuf/gamebase
    go get github.com/$1
}
function ggu () {                # gg jixiuf/gamebase
    go get -u github.com/$1
}

alias aws='ssh deployer@52.68.216.6'
alias deployer="ssh deployer@dev.najaplus.com"
alias sftpstage='sftp deployer@src.najaplus.com'
alias cn="ssh -p 2222 deployer@cn.najaplus.com"
alias product='cd $GOPATH/src/gitlab.luojilab.com/igetserver/product/'
alias src='cd $GOPATH/src/gitlab.luojilab.com/igetserver/'
alias work='ssh work@101.201.45.229'
alias jump='ssh luojilab@101.200.124.254'
alias hist='history'

alias tget="tsocks wget"
alias tumx='TERM=screen-256color tmux'
alias ta='TERM=screen-256color tmux attach'
alias tn='TERM=screen-256color tmux new -A -s'
alias tt='TERM=screen-256color tmux new -A -s $USER'
alias tmux='TERM=screen-256color tmux'
alias httpserver="python -m SimpleHTTPServer 8888"
alias "brewi"="brew install --build-from-source"
alias "tbrewi"="tsocks brew install --build-from-source"
alias d='sudo docker'
alias da='sudo docker attach --sig-proxy=false'
alias lc='launchctl'
# tmux_porcess_cnt=`pgrep tmux |wc -l`


# alias ubuntu="ssh ubuntu@42.62.77.86"
# alias copyright="ssh deployer_copyright@42.62.77.86"

alias g=git
alias gst='git status'
alias gbr='git branch'


alias ftpd="sudo /usr/local/Cellar/proftpd/1.3.4d/sbin/proftpd"
# alias tcpinfo='netstat -n | awk "/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}"'
# alias dev12="cd $GOPATH/src/zerogame.info/thserver/thserver&& ./dev.sh 1 2"
alias download="cd ~/Downloads/"
alias cdd="cd -"
# ssh通过代理
#alias erl='rlwrap -a  erl'
# alias arp='sudo arp'
# alias mysqld='sudo /etc/init.d/mysql restart'
# alias rr='sudo revdep-rebuild -- keep-going;sudo perl-cleaner --all;lafilefixer --justfixit;sudo python-updater;prelink -amR'
# alias eupdatep='sudo emerge -uvDNp --keep-going world>>/tmp/emerge.log 2>&1 '
# alias eupdatec='sudo emerge -uvDN --keep-going world>>/tmp/emerge.log 2>&1 &!'
# alias eupdate='sudo emerge -uvDN --keep-going world>>/tmp/emerge.log 2>&1'
# alias esync="sudo emerge --sync>>/tmp/emerge.log 2>&1&& sudo layman -S ;sudo eix-update>>/tmp/emerge.log 2>&1"
# alias logout="echo 'awesome.quit()'|awesome-client"
# alias emacsd="sudo /etc/init.d/emacs.$USER restart"
# alias emacsq="emacs -q -debug-init"
# alias sftp="sudo /etc/init.d/proftpd restart"
if [ $(uname -s ) = "Linux" ] ; then
    alias ls='ls --color=auto  --time-style=+"%m月%d日 %H:%M"'
    alias la='ls -a --color=auto  '
    alias ll='ls -lth --color=auto --time-style=+"%m月%d日 %H:%M"'
    # sort by time 倒序
    alias llr='ls -lrth --color=auto --time-style=+"%m月%d日 %H:%M"'
    # sort by time
    alias lla='ls -alth --color=auto --time-style=+"%m月%d日 %H:%M"'
    # sort by size
    alias lls='ls -lSh --color=auto --time-style=+"%m月%d日 %H:%M"'
    # sort by name
    alias lln='ls -lh --color=auto --time-style=+"%m月%d日 %H:%M"'
    alias ip="ifconfig eth0;ifconfig eth1"
else
    #-v  http:/lujun.info/2012/10/osx-%E7%9A%84-iterm2%E4%B8%AD%E6%98%BE%E7%A4%BA%E4%B8%AD%E6%96%87%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F/
    alias ip='ifconfig en0'
    alias ipconfig='ifconfig en0'

    # -G color
    alias ls='ls -Gv '
    alias la='ls -aGvv'
    #  -t 按时间排 时间最近的在前面 ,加-r 则反向
    alias ll='ls -lthGv'
    alias llr='ls -ltrhGv'
    alias lla='ls -althGv'
    # sort by size
    alias lls='ls -lShGv'
    # default sort by name
    alias lln='ls -lhGv'
    # sort by cpu
    alias topc='top -o cpu'
    # sort by mreg(memory region)
    alias topm='top -o mreg'
    alias gdb='sudo gdb'
    alias ip="ifconfig en0"

fi
alias chown='chown -R'
alias chmod='chmod -R'
alias sl='ls'
alias mkdir='mkdir -p'
alias cp='cp -r'
alias rm="rm -rf"
alias srm="sudo rm -rf"
alias lp='ls|less'
alias ps='ps -ef'
alias pp='ps -ef|grep -v grep|grep'
alias su="su -l"
alias "df-h"="df -h"
alias "dfh"="df -h"
alias -g ....=" ../../.."
alias -g .....=" ../../../.."
alias -g ...=" ../.."
alias ..="cd .."
alias cd..="cd .."
alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias cd1='cd -'
alias cd2='cd -2'
alias cd3='cd -3'
alias cd4='cd -4'
alias cd5='cd -5'
alias cd6='cd -6'
alias cd7='cd -7'
alias cd8='cd -8'
alias cd9='cd -9'


# alias s=" rc-service"
# alias rs=" rc-service"
# alias rc-status="sudo rc-status"
# alias rc-update="sudo rc-update"
alias xterm='xterm -sl 1500'
alias sqlplus="rlwrap sqlplus"
alias dush="du -sh"

alias v='sudo vim'
# alias vi='em'
# function k(){
#     pid=`ps -ef |grep -v grep|grep "$@"|cut -d " " -f 4`
#     if [ ! -z $pid ]; then
#         kill  $pid
#     fi
# }
# function kk(){
#     pid=`ps -ef |grep -v grep|grep "$@"|cut -d " " -f 4`
#     if [ ! -z $pid ]; then
#         kill -9  $pid
#     fi
# }
# function kkk(){
#     pid=`sudo ps -ef |grep -v grep|grep "$@"|cut -d " " -f 4`
#     if [ ! -z $pid ]; then
#         kill -9  $pid
#     fi
# }
alias k="pkill   -f "
alias kk="pkill  -9 -f "
alias kkk="sudo pkill  -9 -f "
#alias drd="sudo drcomd"
# alias net="sudo /etc/init.d/net.eth0 restart"
# alias ifconfig="sudo ifconfig"
# alias route="sudo route"
# alias halt="sync;sudo shutdown -h now"
# alias reboot="sync;sudo reboot"
alias mount="sudo mount"
alias umount="sudo umount"
alias ettercap="sudo ettercap "
# alias env-update="sudo env-update"
# alias etc-update="sudo etc-update"
alias date="date +%Y-%m-%d_%H:%M-%A.%z"

#export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
#export PS1="\[\e[01;32m\]\u\[\e[01;34m\] \W \$\[\e[00m\] "

# alias net="sudo rm /var/lib/dhcpcd/dhcpcd-eth0.lease;sudo /etc/init.d/net.eth0 restart"
alias df="df -h"
# alias light="echo -n 40|sudo tee /proc/acpi/video/VGA/LCD/brightness"
# alias du="du -sh"
# }}}
alias -s html=vi   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
# alias -s rb=vi     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
# alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s el=ec
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias svnreset='svn revert -R .;for file in `svn status|grep "^ *?"|sed -e "s/^ *? *//"`; do rm $file ; done'
alias ftpserver='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
alias ftpserver_stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'

#这样可以使你上面定义的那些alias 在sudo 时管用
#http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo #
alias sudo='sudo '

# {{{ 关于历史纪录的配置
setopt hist_ignore_all_dups hist_ignore_space # 如果你不想保存重复的历史
#历史纪录条目数量
export HISTSIZE=10000
#注销后保存的历史纪录条目数量
export SAVEHIST=10000
#历史纪录文件
export HISTFILE=~/.zsh_history
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
#为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY

#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS

#在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_IGNORE_SPACE


ulimit -n 10000

# {{{ color
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval $color='%{$fg[${(L)color}]%}'
(( count = $count + 1 ))
done

# 标题栏、任务栏样式
case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
   preexec () {
#       print -Pn "\e]0;%n@%M//%/\ $1\a"
       print -Pn "\e]0;%~ $1\a"
}
   ;;
esac

# {{{ 杂项
#允许在交互模式中使用注释  例如：
#cmd #这是注释
setopt INTERACTIVE_COMMENTS

#启用自动 cd，输入目录名回车进入目录
#稍微有点混乱，不如 cd 补全实用
setopt AUTO_CD

#扩展路径
setopt complete_in_word

#禁用 core dumps
limit coredumpsize 0

#Emacs风格 键绑定
bindkey -e
#设置 [DEL]键 为向后删除
bindkey "\e[3~" delete-char
# {{{ bindkey -L 列出现有的键绑定
# bindkey "" beginning-of-line #这个好像不起作用
bindkey \^H backward-kill-word
bindkey \^Z set-mark-command
bindkey \^U backward-kill-line

# Alt-r
bindkey "^[r" history-incremental-search-backward
bindkey "^[n" down-line-or-history
bindkey "^[p" up-line-or-history


#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
# }}}
# {{{ 行编辑高亮模式
# Ctrl+@ 设置标记，标记和光标点之间为 region
zle_highlight=(region:bg=magenta #选中区域
               special:bold      #特殊字符
               isearch:underline)#搜索时使用的关键字
# }}}

#显示 path-directories ，避免候选项唯一时直接选中
cdpath="/home"
# }}}

# {{{ startx
# if [ $(uname -s ) = "Linux" ] ; then
#  if [ ! -f /tmp/.X0-lock  ] ; then
# 	 startx
# 	logout
#  fi
# fi

if [ -f ~/.gentoo/java-env-classpath  ] ; then
   . ~/.gentoo/java-env-classpath
fi


# }}}
# {{{ 路径别名
#进入相应的路径时只要 cd ~xxx
hash -d E="/etc/env.d"
hash -d C="/etc/conf.d"
hash -d I="/etc/rc.d"
hash -d X="/etc/X11"
hash -d HIST="$HISTDIR"
# #export GDK_NATIVE_WINDOWS=true
# export AWT_TOOLKIT=MToolkit
# export _JAVA_AWT_WM_NONREPARENTING=1
# # wmname LG3D

#mkdir /var/tmp/ccache
#mount -o bind /resource/pkg/gentoo/ccache/ /var/tmp/ccache
#export PATH=$PATH:/java/java/android-sdk-linux_86/platform-tools/:/java/java/android-sdk-linux_86/tools/

function dmalloc { eval `command dmalloc -b $*`; }


if [ $(uname -s ) = "Darwin" ] ; then
    if [ -f /usr/local/Library/Contributions/brew_zsh_completion.zsh ]; then
        ln -s -f /usr/local/Library/Contributions/brew_zsh_completion.zsh ~/.zsh/site-functions/_brew
    fi
fi

# {{{ 自动补全功能
#setopt AUTO_LIST
setopt AUTO_MENU
#开启此选项，补全时会直接选中菜单项
#setopt MENU_COMPLETE
#横向排列
setopt  LIST_ROWS_FIRST

autoload -U compinit
compinit


#自动补全缓存
#zstyle ':completion::complete:*' use-cache on
#zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#自动补全选项
zstyle ':completion:*' verbose yes
#指定使用菜单,select表示会高亮选中当前在哪个选项上,no=5表示当候选项大于5时就不自动补全
#而仅仅是列出可用的候选项,这样可以手动输入内容后过滤掉一部分
#也就是说只有少于5个选项的时候而循环选中每一个
#yes=long表示当无法完整显示所有内容时,可以循环之
# zstyle ':completion:*' menu select no=8 yes=long
zstyle ':completion:*' menu select yes=long no=8
#force-list表示尽管只有一个候选项,也更出菜单,没必要
#zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'


zstyle ':completion:*' list-colors ''

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

#路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::complete:*' '\\'

#彩色补全菜单
#eval $(dircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#kill 命令补全
# compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

#补全类型提示分组
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

# cd ~ 补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
# }}}
# {{{自定义补全
#补全 ping
# zstyle ':completion:*:ping:*' hosts 192.168.128.1{38,} http://www.g.cn  192.168.{1,0}.1{{7..9},}

#补全 ssh scp sftp 等
my_accounts=(
# deployer,ubuntu
# deployer@{src.najaplus.com,zjh.pro.cn.najaplus.com}, # 
deployer@{src.najaplus.com,zjh.pro.cn.najaplus.com}
# kardinal@linuxtoy.org
# 123@211.148.131.7
)
zstyle ':completion:*:my-accounts' users-hosts $my_accounts

# F1 计算器
# arith-eval-echo() {
#   LBUFFER="${LBUFFER}echo \$(( "
#   RBUFFER=" ))$RBUFFER"
# }
# zle -N arith-eval-echo
# bindkey "^[[11~" arith-eval-echo

# {{{ (光标在行首)补全 "cd "
user-complete(){
    case $BUFFER in
        # "" )                       # 空行填入 "cd "
        #     BUFFER="cd "
        #     zle end-of-line
        #     zle expand-or-complete
        #     ;;
        "cd  " )                   # TAB + 空格 替换为 "cd ~"
            BUFFER="cd ~"
            zle end-of-line
            zle expand-or-complete
            ;;
        " " )
            BUFFER="!?"
            zle end-of-line
            ;;
        # "cd --" )                  # "cd --" 替换为 "cd +"
        #     BUFFER="cd +"
        #     zle end-of-line
        #     zle expand-or-complete
        #     ;;
        # "cd +-" )                  # "cd +-" 替换为 "cd -"
        #     BUFFER="cd -"
        #     zle end-of-line
        #     zle expand-or-complete
        #     ;;
        * )
            zle expand-or-complete
            ;;
    esac
}
zle -N user-complete
bindkey "\t" user-complete

FINISH="%{$terminfo[sgr0]%}"
precmd () {
    # local count_db_wth_char=${#${${(%):-%/}//[[:ascii:]]/}}
    # local leftsize=${#${(%):-%(!.%B$RED%n.%B$GREEN%n)@%m$CYAN %2~ $WHITE%#%(1j.(%j jobs%).) %b}}+$count_db_wth_char
    # local rightsize=${#${(%):-%D %T }}
    # HBAR=" "
    # FILLBAR="\${(l.(($COLUMNS - ($leftsize + $rightsize +2)))..${HBAR}.)}"


    # zsh 显示git 分支信息 begin
    setopt prompt_subst
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' actionformats \
           '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
    zstyle ':vcs_info:*' formats '%F{3}(%F{5}%b%F{3})%f '
    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

    zstyle ':vcs_info:*' enable git svn

    # or use pre_cmd, see man zshcontrib
    vcs_info_wrapper() {
        vcs_info
        if [ -n "$vcs_info_msg_0_" ]; then
            echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
        fi
    }
    # 注掉下面RPROMP内容 与下面的 RPROMPT合并
    # RPROMPT=$'$(vcs_info_wrapper)'
    # zsh 显示git 分支信息 end

    #当上一个命令不正常退出时的提示  及显示git 分支信息
    if [ -z "$INSIDE_EMACS" ]; then # 如果不是在emacs 中的term,则有右提示符
        RPROMPT=$(echo "%(?..$RED%?$FINISH)")
    fi
    
    PROMPT=$(echo "%(!.%B$RED%n.%B$GREEN%n)@%m$CYAN %2~ $(vcs_info_wrapper)$WHITE%(!.#.$)%(1j.(%j jobs%).) %b")

    #在 Emacs终端 中使用 Zsh 的一些设置 及Eamcs tramp sudo 远程连接的设置
    if [[ "$TERM" == "dumb" ]]; then
        prompt='%1/ %(!.#.$) '
        unsetopt zle
        unsetopt prompt_cr
        unsetopt prompt_sp
        unsetopt prompt_subst
        unfunction precmd
        unfunction preexec
        PS1='$ '    
        return
    fi
}



#PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# set FPATH
# 一些补全的函数 从这里加载
if [ -d /usr/local/share/zsh/site-functions/ ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
    # rm -f ~/.zcompdump; nohup compinit>/dev/null
fi
if [ -d ~/.zsh/site-functions  ]; then
    fpath=(~/.zsh/site-functions $fpath)
    # rm -f ~/.zcompdump; compinit
fi

# for golang
# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# if [ -f ~/.zshenv ]; then
#    .  ~/.zshenv
# fi
##########################################################################################################
# begin of golang
##########################################################################################################
# install in /etc/zsh/zshrc or your personal .zshrc

# gc
prefixes=(5 6 8)
for p in $prefixes; do
	compctl -g "*.${p}" ${p}l
	compctl -g "*.go" ${p}g
done

# standard go tools
compctl -g "*.go" gofmt

# gccgo
compctl -g "*.go" gccgo

# go tool
__go_tool_complete() {
  typeset -a commands build_flags
  commands+=(
    'build[compile packages and dependencies]'
    'clean[remove object files]'
    'doc[run godoc on package sources]'
    'env[print Go environment information]'
    'fix[run go tool fix on packages]'
    'fmt[run gofmt on package sources]'
    'get[download and install packages and dependencies]'
    'help[display help]'
    'install[compile and install packages and dependencies]'
    'list[list packages]'
    'run[compile and run Go program]'
    'test[test packages]'
    'tool[run specified go tool]'
    'version[print Go version]'
    'vet[run go tool vet on packages]'
  )
  if (( CURRENT == 2 )); then
    # explain go commands
    _values 'go tool commands' ${commands[@]}
    return
  fi
  build_flags=(
    '-a[force reinstallation of packages that are already up-to-date]'
    '-n[print the commands but do not run them]'
    '-p[number of parallel builds]:number'
    '-race[enable data race detection]'
    '-x[print the commands]'
    '-work[print temporary directory name and keep it]'
    '-ccflags[flags for 5c/6c/8c]:flags'
    '-gcflags[flags for 5g/6g/8g]:flags'
    '-ldflags[flags for 5l/6l/8l]:flags'
    '-gccgoflags[flags for gccgo]:flags'
    '-compiler[name of compiler to use]:name'
    '-installsuffix[suffix to add to package directory]:suffix'
    '-tags[list of build tags to consider satisfied]:tags'
  )
  __go_list() {
      local expl importpaths
      declare -a importpaths
      importpaths=($(go list ${words[$CURRENT]}... 2>/dev/null))
      _wanted importpaths expl 'import paths' compadd "$@" - "${importpaths[@]}"
  }
  case ${words[2]} in
  clean|doc)
      _arguments -s -w : '*:importpaths:__go_list'
      ;;
  fix|fmt|list|vet)
      _alternative ':importpaths:__go_list' ':files:_path_files -g "*.go"'
      ;;
  install)
      _arguments -s -w : ${build_flags[@]} \
        "-v[show package names]" \
        '*:importpaths:__go_list'
      ;;
  get)
      _arguments -s -w : \
        ${build_flags[@]}
      ;;
  build)
      _arguments -s -w : \
        ${build_flags[@]} \
        "-v[show package names]" \
        "-o[output file]:file:_files" \
        "*:args:{ _alternative ':importpaths:__go_list' ':files:_path_files -g \"*.go\"' }"
      ;;
  test)
      _arguments -s -w : \
        ${build_flags[@]} \
        "-c[do not run, compile the test binary]" \
        "-i[do not run, install dependencies]" \
        "-v[print test output]" \
        "-x[print the commands]" \
        "-short[use short mode]" \
        "-parallel[number of parallel tests]:number" \
        "-cpu[values of GOMAXPROCS to use]:number list" \
        "-run[run tests and examples matching regexp]:regexp" \
        "-bench[run benchmarks matching regexp]:regexp" \
        "-benchmem[print memory allocation stats]" \
        "-benchtime[run each benchmark until taking this long]:duration" \
        "-blockprofile[write goroutine blocking profile to file]:file" \
        "-blockprofilerate[set sampling rate of goroutine blocking profile]:number" \
        "-timeout[kill test after that duration]:duration" \
        "-cpuprofile[write CPU profile to file]:file:_files" \
        "-memprofile[write heap profile to file]:file:_files" \
        "-memprofilerate[set heap profiling rate]:number" \
        "*:args:{ _alternative ':importpaths:__go_list' ':files:_path_files -g \"*.go\"' }"
      ;;
  help)
      _values "${commands[@]}" \
        'gopath[GOPATH environment variable]' \
        'packages[description of package lists]' \
        'remote[remote import path syntax]' \
        'testflag[description of testing flags]' \
        'testfunc[description of testing functions]'
      ;;
  run)
      _arguments -s -w : \
          ${build_flags[@]} \
          '*:file:_path_files -g "*.go"'
      ;;
  tool)
      if (( CURRENT == 3 )); then
          _values "go tool" $(go tool)
          return
      fi
      case ${words[3]} in
      [568]g)
          _arguments -s -w : \
              '-I[search for packages in DIR]:includes:_path_files -/' \
              '-L[show full path in file:line prints]' \
              '-S[print the assembly language]' \
              '-V[print the compiler version]' \
              '-e[no limit on number of errors printed]' \
              '-h[panic on an error]' \
              '-l[disable inlining]' \
              '-m[print optimization decisions]' \
              '-o[file specify output file]:file' \
              '-p[assumed import path for this code]:importpath' \
              '-u[disable package unsafe]' \
              "*:file:_files -g '*.go'"
          ;;
      [568]l)
          local O=${words[3]%l}
          _arguments -s -w : \
              '-o[file specify output file]:file' \
              '-L[search for packages in DIR]:includes:_path_files -/' \
              "*:file:_files -g '*.[ao$O]'"
          ;;
      dist)
          _values "dist tool" banner bootstrap clean env install version
          ;;
      *)
          # use files by default
          _files
          ;;
      esac
      ;;
  esac
}

##########################################################################################################
# end of golang
##########################################################################################################

compdef __go_tool_complete go
