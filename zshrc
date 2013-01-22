#!/bin/zsh
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
FINISH="%{$terminfo[sgr0]%}"
# }}}
# {{{ 命令提示符
precmd () {
# local count_db_wth_char=${#${${(%):-%/}//[[:ascii:]]/}}
# local leftsize=${#${(%):-%(!.%B$RED%n.%B$GREEN%n)@%m$CYAN %2~ $WHITE%#%(1j.(%j jobs%).) %b}}+$count_db_wth_char
# local rightsize=${#${(%):-%D %T }}
# HBAR=" "
# FILLBAR="\${(l.(($COLUMNS - ($leftsize + $rightsize +2)))..${HBAR}.)}"

#当上一个命令不正常退出时的提示
RPROMPT=$(echo "%(?..$RED%?$FINISH)")
PROMPT=$(echo "%(!.%B$RED%n.%B$GREEN%n)@%m$CYAN %2~ $WHITE%(!.#.$)%(1j.(%j jobs%).) %b")

#在 Emacs终端 中使用 Zsh 的一些设置 及Eamcs tramp sudo 远程连接的设置
if [[ "$TERM" == "dumb" ]]; then
    prompt='%1/ %(!.#.$) '
    setopt No_zle
    setopt No_prompt_cr
    setopt No_prompt_sp
fi    
}
# }}}

# {{{ 标题栏、任务栏样式
case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
   preexec () {
#       print -Pn "\e]0;%n@%M//%/\ $1\a"
       print -Pn "\e]0;%~ $1\a"
}
   ;;
esac
# }}}

# {{{ 关于历史纪录的配置
#历史纪录条目数量
export HISTSIZE=10000
#注销后保存的历史纪录条目数量
export SAVEHIST=10000
#历史纪录文件
export HISTFILE=~/.zh_history
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
#setopt HIST_IGNORE_SPACE     
# }}}

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

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
# }}}
# {{{ 行编辑高亮模式
# Ctrl+@ 设置标记，标记和光标点之间为 region
zle_highlight=(region:bg=magenta #选中区域
               special:bold      #特殊字符
               isearch:underline)#搜索时使用的关键字
# }}}

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
zstyle ':completion:*' menu select yes=long     
#force-list表示尽管只有一个候选项,也更出菜单,没必要
#zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'
 

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
eval $(dircolors -b)
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
zstyle ':completion:*:ping:*' hosts 192.168.128.1{38,} http://www.g.cn \
       192.168.{1,0}.1{{7..9},}

#补全 ssh scp sftp 等
my_accounts=(
{r00t,root}@{192.168.1.1,192.168.0.1}
kardinal@linuxtoy.org
123@211.148.131.7
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
        "" )                       # 空行填入 "cd "
            BUFFER="cd "
            zle end-of-line
            zle expand-or-complete
            ;;
        "cd  " )                   # TAB + 空格 替换为 "cd ~"
            BUFFER="cd ~"
            zle end-of-line
            zle expand-or-complete
            ;;
        " " )
            BUFFER="!?"
            zle end-of-line
            ;;
        "cd --" )                  # "cd --" 替换为 "cd +"
            BUFFER="cd +"
            zle end-of-line
            zle expand-or-complete
            ;;
        "cd +-" )                  # "cd +-" 替换为 "cd -"
            BUFFER="cd -"
            zle end-of-line
            zle expand-or-complete
            ;;
        * )
            zle expand-or-complete
            ;;
    esac
}
zle -N user-complete
bindkey "\t" user-complete

#显示 path-directories ，避免候选项唯一时直接选中
cdpath="/home"
# }}}

# {{{ startx

if [ ! -f /tmp/.X0-lock  ] ; then 
	 startx  
	logout
fi

if [ -f ~/.gentoo/java-env-classpath  ] ; then 
   . ~/.gentoo/java-env-classpath
fi


# }}}
# {{{ 路径别名
#进入相应的路径时只要 cd ~xxx
hash -d WWW="/home/lighttpd/html"
hash -d ARCH="/mnt/arch"
hash -d E="/etc/env.d"
hash -d C="/etc/conf.d"
hash -d I="/etc/rc.d"
hash -d X="/etc/X11"
hash -d HIST="$HISTDIR"
# }}}
# {{{ export
if [ -f ~/.mozilla/firefox/profiles.ini  ] ; then
   export AXEL_COOKIES=~/.mozilla/firefox/`cat ~/.mozilla/firefox/profiles.ini |grep Path|cut  -d "=" -f 2`/cookies.sqlite
fi    
#export GDK_NATIVE_WINDOWS=true
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
# wmname LG3D
# }}}
# {{{ bindkey -L 列出现有的键绑定
# bindkey "" beginning-of-line #这个好像不起作用
bindkey "" backward-kill-word
bindkey "" set-mark-command

# Alt-r
bindkey "^[r" history-incremental-search-backward
bindkey "^[n" down-line-or-history
bindkey "^[p" up-line-or-history

# }}}
#mkdir /var/tmp/ccache
#mount -o bind /resource/pkg/gentoo/ccache/ /var/tmp/ccache   
export PATH=$PATH:/java/java/android-sdk-linux_86/platform-tools/:/java/java/android-sdk-linux_86/tools/

function dmalloc { eval `command dmalloc -b $*`; }
# {{{ alias
alias cdd="cd -"
# ssh通过代理
alias yanfa="TERM=rxvt sudo ssh -o ProxyCommand='socat - socks:122.224.249.55:%h:%p,socksport=9991' app100622829@10.142.8.24 -p 36000"
alias erl='rlwrap -a  erl'
alias arp='sudo arp'
alias mysqld='sudo /etc/init.d/mysql restart'
alias rr='sudo revdep-rebuild -- keep-going;sudo perl-cleaner --all;lafilefixer --justfixit;sudo python-updater;prelink -amR'
alias eupdatep='sudo emerge -uvDNp --keep-going world>>/tmp/emerge.log 2>&1 '
alias eupdatec='sudo emerge -uvDN --keep-going world>>/tmp/emerge.log 2>&1 &!'
alias eupdate='sudo emerge -uvDN --keep-going world>>/tmp/emerge.log 2>&1'
alias esync="sudo emerge --sync>>/tmp/emerge.log 2>&1&& sudo layman -S ;sudo eix-update>>/tmp/emerge.log 2>&1"
alias logout="echo 'awesome.quit()'|awesome-client"
alias emacsd="sudo /etc/init.d/emacs.$USER restart"
alias emacsq="emacs -q -debug-init"
alias sftp="sudo /etc/init.d/proftpd restart"
alias la='ls -a --color=auto  '
alias ll='ls -lth --color=auto --time-style=+"%m月%d日 %H:%M"'
alias lla='ls -alth --color=auto --time-style=+"%m月%d日 %H:%M"'
alias sl='ls'
alias mkdir='mkdir -p'
alias cp='cp -r'
alias rm="sudo rm -rf"
alias lp='ls|less'
alias lls='ls'
alias ps='ps -ef'
alias pp='ps -ef|grep '
alias su="su -l"
alias "df-h"="df -h"
alias -g ...=" ../.."
alias ..="cd .."
alias cd..="cd .."
alias s=" rc-service"
alias rs=" rc-service"
alias rc-status="sudo rc-status"
alias rc-update="sudo rc-update"
alias xterm='xterm -sl 1500'
alias sqlplus="rlwrap sqlplus"
alias dush="du -sh"

alias v='sudo vim'
alias k="sudo pkill  -9 -f "
#alias drd="sudo drcomd"
alias net="sudo /etc/init.d/net.eth0 restart"
alias ifconfig="sudo ifconfig"
alias ip="sudo ifconfig"
alias route="sudo route"
alias halt="sync;sudo shutdown -h now"
alias reboot="sync;sudo reboot"
alias mount="sudo mount"
alias umount="sudo umount"
alias ettercap="sudo ettercap "
alias env-update="sudo env-update"
alias etc-update="sudo etc-update"
alias date="date +%Y-%m-%d_%H:%M-%A"
#export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
#export PS1="\[\e[01;32m\]\u\[\e[01;34m\] \W \$\[\e[00m\] "
alias ls='ls --color=auto  --time-style=+"%m月%d日 %H:%M"'
alias net="sudo rm /var/lib/dhcpcd/dhcpcd-eth0.lease;sudo /etc/init.d/net.eth0 restart"
alias df="df -h"
alias light="echo -n 40|sudo tee /proc/acpi/video/VGA/LCD/brightness"
# alias du="du -sh"
# }}}
