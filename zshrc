# shell

## PROMPT
export PROMPT="%n@%1~ %# "

## EDITOR
export EDITOR="vim"

# python
export PATH="/Users/ahnkiwook/Library/Python/3.9/bin:$PATH"

# Homebrew

## path
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/homebrew/bin:/usr/local/homebrew/sbin:$PATH"

## for packages

### openssl
export PATH="/opt/homebrew/opt/openssl/bin:$PATH"
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"

### zsh

#### zsh-completion
if type brew &>/dev/null; then
  FPATH=/opt/homebrew/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

#### zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#### zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#### share history
setopt share_history

### rust

#### cargo
export PATH="$HOME/.cargo/bin:$PATH"

#### exa
if [ "$(which exa)" != "" ]; then
  alias ls="exa"
fi

### nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# etc...

## pipx
export PIPX_DEFAULT_PYTHON="$(which python3)"
export PATH="$HOME/.local/bin:$PATH"

## virtualenvwrapper
export WORKON_HOME=~/.venvs
export VIRTUALENVWRAPPER_PYTHON="$HOME/.local/pipx/venvs/virtualenvwrapper/bin/python"
export VIRTUALENVWRAPPER_VIRTUALENV="$HOME/.local/pipx/venvs/virtualenvwrapper/bin/virtualenv"
source "$HOME/.local/pipx/venvs/virtualenvwrapper/bin/virtualenvwrapper.sh"

## terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/homebrew/bin/terraform terraform

## Zinit installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
