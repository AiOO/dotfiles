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

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
