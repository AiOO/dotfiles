# shell

## PROMPT
export PROMPT="%n@%1~ %# "

## EDITOR
export EDITOR="vim"

# Homebrew

## path
export PATH="/opt/Homebrew/bin:/usr/local/Homebrew/bin:$PATH"

## for multi architectures
alias brew="/opt/Homebrew/bin/brew"
alias ibrew="arch -x86_64 /usr/local/Homebrew/bin/brew"

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
export PATH="$HOME/.local/bin:$PATH"

## virtualenvwrapper
export WORKON_HOME=~/.venvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/local/bin/virtualenvwrapper.sh

## gpg signing
export GPG_TTY=$(tty)

## terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Homebrew/bin/terraform terraform
