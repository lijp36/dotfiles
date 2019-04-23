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

export FZF_DEFAULT_COMMAND='rg --files'
# https://github.com/junegunn/fzf/wiki/Color-schemes
export FZF_DEFAULT_OPTS="--layout=reverse  --exact --no-height --cycle  --color hl:#ffd900,hl+:#79ed0d,bg+:#616161,info:#616161,prompt:#b4fa72,spinner:107,pointer:#b4fa72  --inline-info --prompt='filter: '  --bind=ctrl-k:kill-line,ctrl-v:page-down,alt-v:page-up --preview 'echo {}'  --preview-window up:3:wrap"
# 有些太长，一行显示不下，在最后3行进行预览完整命令
export FZF_CTRL_R_OPTS="--sort  "
# export FZF_CTRL_R_OPTS="--sort --exact --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
