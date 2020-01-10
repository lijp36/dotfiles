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
vterm_prompt_begin(){
  printf "\e]51;C\e\\"
}
vterm_prompt_end(){
  # printf "\e]51;A$(pwd)\e\\"
  printf "\e]51;A$(whoami)@$(hostname):$(pwd)\e\\"
}
PS1='\[$(vterm_prompt_begin)\]'$PS1'\[$(vterm_prompt_end)\]'

test -e "${HOME}/.bash-preexec.sh" && source "${HOME}/.bash-preexec.sh"
preexec() { printf "\e]51;B\e\\"; } #mark the end of cmd
# precmd() { echo "printing the prompt"; }
function clear(){
    printf  "\e]51;E(vterm-clear-scrollback)\e\\";
    tput clear;
}
function vi(){
    printf  "\e]51;E(find-file \"$@\")\e\\"
}

