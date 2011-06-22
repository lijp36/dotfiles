# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
# Put your fun stuff here.
#for eclipse 
alias v='sudo vim'
alias e='sudo emerge'
alias emerge='sudo emerge'
#alias emerge='urxvtc -name emerge -e sudo   emerge'
alias k="sudo pkill -9 "
alias drcomd=" sudo drcomd"
alias drd="sudo drcomd"
alias kd="sudo killall drcomd"
alias net="sudo /etc/init.d/net.eth0 restart"
alias ifconfig="sudo ifconfig"
alias ip="sudo ifconfig"
alias route="sudo route"
alias halt="sync;sudo shutdown -h now"
alias reboot="sync;sudo killall drcomd;sudo reboot"
alias mount="sudo mount"
alias umount="sudo umount"
alias s="sudo rc-service"
alias rs="sudo rc-service"
alias ettercap="sudo ettercap "
alias rc-status="sudo rc-status"
alias rc-update="sudo rc-update"
alias env-update="sudo env-update"
alias etc-update="sudo etc-update"
alias date="date +%Y-%m-%d_%H:%M-%A"
#export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
#export PS1="\[\e[01;32m\]\u\[\e[01;34m\] \W \$\[\e[00m\] "
export AXEL_COOKIES=~/.mozilla/firefox/`cat ~/.mozilla/firefox/profiles.ini |grep Path|cut  -d "=" -f 2`/cookies.sqlite
if [ ! -f /tmp/.X0-lock  ] ; then 
	 startx  
	logout
 fi
source ~/.gentoo/java-env-classpath

