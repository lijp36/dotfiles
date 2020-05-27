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
export PS1='$(hostname):$(pwd) $(whoami)\$ '
PS1='\$ '
function vterm_printf(){
    if [ -n "$TMUX" ]; then
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end(){
  vterm_printf   "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1='$PS1'\[$(vterm_prompt_end)\]'

# precmd() { echo "printing the prompt"; }
function clear(){
    vterm_printf   "51;Evterm-clear-scrollback";
    tput clear;
}
function vi(){
    vterm_printf  "\e]51;E(find-file \"$@\")\e\\"
}

