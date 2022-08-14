# shell

## PROMPT
export PROMPT="%n@%1~ %# "

## EDITOR
export EDITOR="vim"

# Homebrew

## path
export PATH="/opt/Homebrew/bin:/opt/Homebrew/sbin:/usr/local/Homebrew/bin:/usr/local/Homebrew/sbin:$PATH"

## for multi architectures
alias ibrew="arch -x86_64 /usr/local/Homebrew/bin/brew"
alias ipython="/usr/local/Homebrew/Cellar/python@3.9/3.9.13_1/bin/python3"
alias ipip="/usr/local/Homebrew/Cellar/python@3.9/3.9.13_1/bin/pip3"

## for packages

### openssl
export PATH="/opt/Homebrew/opt/openssl/bin:$PATH"
export CFLAGS="-I/opt/Homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/Homebrew/opt/openssl/lib"

### zsh

#### zsh-completion
if type brew &>/dev/null; then
  FPATH=/opt/Homebrew/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

#### zsh-autosuggestions
source /opt/Homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#### zsh-syntax-highlighting
source /opt/Homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### rust

#### cargo
export PATH="$HOME/.cargo/bin:$PATH"

#### exa
if [ "$(which exa)" != "" ]; then
  alias ls="exa"
fi

### nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/Homebrew/opt/nvm/nvm.sh" ] && . "/opt/Homebrew/opt/nvm/nvm.sh"
[ -s "/opt/Homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/Homebrew/opt/nvm/etc/bash_completion.d/nvm"

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
complete -o nospace -C /usr/local/Homebrew/bin/terraform terraform
