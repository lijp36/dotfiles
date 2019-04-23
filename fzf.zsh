# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# CTRL-R - Paste the selected command from history into the command line
# 改造fc -rl 1 改成history -n 1
fzf-history-widget() {
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  eval  history -nr  1 |
      FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd) |
      while read item; do
          # LBUFFER="${(q)item} "       # quote item
          LBUFFER="${item} "
      done
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget



export FZF_DEFAULT_COMMAND='rg --files'
# https://github.com/junegunn/fzf/wiki/Color-schemes
export FZF_DEFAULT_OPTS="--layout=reverse  --exact --no-height --cycle  --color hl:#ffd900,hl+:#79ed0d,bg+:#616161,info:#616161,prompt:#b4fa72,spinner:107,pointer:#b4fa72  --inline-info --prompt='filter: '  --bind=ctrl-k:kill-line,ctrl-v:page-down,alt-v:page-up,ctrl-m:accept --preview 'echo {}'  "
# 有些太长，一行显示不下，在最后3行进行预览完整命令
export FZF_CTRL_R_OPTS="  --preview-window up:3:wrap"
# export FZF_CTRL_R_OPTS="--sort --exact --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

