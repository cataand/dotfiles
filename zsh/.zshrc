# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cata/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $HOME/.local/share/zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

# Add Cargo to path
path+=("$HOME/.cargo/bin")
export PATH

# Add Direnv hook
eval "$(direnv hook zsh)"
