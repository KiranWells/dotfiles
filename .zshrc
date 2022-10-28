if [ -x "$(command -v fet.sh)" ]; then
  # info="n user os sh wm up cpu mem host kern pkgs term n col n" colourblocks='█' fet.sh
  # info="n user os sh wm up cpu mem host kern pkgs term col n" colourblocks='▄▄' fet.sh
  info="n user os sh wm up mem host kern pkgs term col n" fet.sh
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle colored-man-pages
antigen bundle autojump

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme romkatv/powerlevel10k 

antigen apply

DISABLE_AUTO_TITLE="true"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# some convenient functions
function count() {
  sort | uniq -c | sort -nr
}

alias clockin="(cd ~/spyderbat/docs/ && ./clock.sh in)"
alias clockout="(cd ~/spyderbat/docs/ && ./clock.sh out)"

PATH="/home/kiran/.cargo/bin:$PATH"

# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:\n:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# default workspace for Executors
export JINA_DEFAULT_WORKSPACE_BASE="${HOME}/.jina/executor-workspace"

# JINA_CLI_END
