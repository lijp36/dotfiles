#!/bin/sh
#     if [ -z "$1" ]
#     then   #如果没有文件名
#     echo ' show_matched_client({class="Emacs" ,instance="emacs"},"emacs","/usr/bin/emacsclient -c " ,nil)' |awesome-client
# #        emacsclient -c  >/dev/null &
#     else  #有文件名时 #先尝试显示已经存在的emacsclient(可能处于隐藏态) 
#     echo ' show_matched_client({class="Emacs" ,instance="emacs"},"emacs","/usr/bin/emacsclient -c " ,nil)' |awesome-client
#     #然后编辑
# #         /usr/bin/emacsclient    -n  "$@" 
# #         /usr/bin/emacsclient   --eval   "(find-file (expand-file-name \"$1\"  \"$PWD\")  )"
#     /usr/bin/emacsclient  "$@" 
#     fi


# raise the frame 
    echo ' show_matched_client({class="Emacs" ,instance="emacs"},"emacs","/usr/bin/emacsclient -c " ,nil)' |awesome-client
    if  [ -n "$1" ] #如果$1长度不为0
    then 
        /usr/bin/emacsclient  --socket-name "/tmp/emacs$UID/server" "$@"
    # else
    #     /usr/bin/emacsclient  
    fi
