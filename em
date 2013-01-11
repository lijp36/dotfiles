#!/bin/bash

if [ -z "$1" ]
then
    /usr/bin/emacsclient -t --socket-name "/tmp/emacs$UID/server" 
else
    /usr/bin/emacsclient -t  --socket-name "/tmp/emacs$UID/server"  "$@"
fi

