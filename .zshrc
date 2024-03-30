export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 
echo "Checking for tmux sessions..."
tmux ls

# complete -C /usr/bin/terraform terraform
  
alias delete-merged='git branch --merged | egrep -v "(^\*|master|main|dev|development)" | xargs git branch -d'
nvm use node

# add lua bin to path
export LUAPATH=/home/apiyo/lua-5.4.6/src
export PATH=$PATH:$LUAPATH:/home/apiyo/.cargo/bin

source_env_if_exists() {}
xset led 3

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

