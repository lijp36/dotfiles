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
# }}}
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
#export PATH=$PATH:/java/java/android-sdk-linux_86/platform-tools/:/java/java/android-sdk-linux_86/tools/

function dmalloc { eval `command dmalloc -b $*`; }


if [ -f ~/.zsh/complete-zsh  ] ; then
   . ~/.zsh/complete-zsh
fi
if [ -f ~/.zsh/golang-config-zsh  ] ; then
   . ~/.zsh/golang-config-zsh 
fi
if [ -f ~/.zsh/alias-zsh  ] ; then
   . ~/.zsh/alias-zsh 
fi
if [ -f ~/.zsh/prompt-zsh  ] ; then
   . ~/.zsh/prompt-zsh
fi
if [ -f ~/.zsh/hist-zsh  ] ; then
   . ~/.zsh/hist-zsh
fi

if [ $(uname -s ) = "Darwin" ] ; then
    if [ -f ~/.zsh/osx-zsh  ] ; then
        . ~/.zsh/osx-zsh
    fi
fi
#PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
if [ -d /Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home ]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home    
fi

if [ -d $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi

if [ -d /Applications/adt-bundle-mac-x86_64-20140321/sdk/tools ]; then
    export PATH=$PATH:/Applications/adt-bundle-mac-x86_64-20140321/sdk/tools 
fi

if [ -d /Applications/adt-bundle-mac-x86_64-20140321/sdk/platform-tools/ ]; then
    export PATH=$PATH:/Applications/adt-bundle-mac-x86_64-20140321/sdk/platform-tools
fi
