function vterm_print; 
    if [ -n "$TMUX" ]
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end
    
    function vterm_cmd_end --on-event fish_preexec; printf "\e]51;B\e\\"; end
         
function vterm_prompt_begin;
    vterm_print '51;C'
end

function vterm_prompt_end;
    vterm_print '51;A'(whoami)'@'(hostname)':'(pwd)
end


functions -c fish_mode_prompt vterm_old_fish_mode_prompt
function fish_mode_prompt --description 'Write out the prompt; do not replace this. Instead, put this at end of your file.'
    vterm_prompt_begin
    vterm_old_fish_mode_prompt
end

functions -c fish_prompt vterm_old_fish_prompt
function fish_prompt --description 'Write out the prompt; do not replace this. Instead, put this at end of your file.'
    # Remove the trailing newline from the original prompt. This is done
    # using the string builtin from fish, but to make sure any escape codes
    # are correctly interpreted, use %b for printf.
    printf "%b" (string join "\n" (vterm_old_fish_prompt))

    vterm_prompt_end
end