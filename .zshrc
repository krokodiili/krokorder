QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

export NVM_DIR=~/.nvm
export JAVA_HOME="/opt/android-studio/jbr"
export PIPEWIRE_CONFIG_FILE="$HOME/.config/pipewire/pipewire.conf"

#ANDROID
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export SSH_LOCATION=$HOME/.ssh
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.cargo/bin

export IDEA_JDK=/usr/lib/jvm/jre-jetbrains
      export PHPSTORM_JDK=/usr/lib/jvm/jre-jetbrains
      export WEBIDE_JDK=/usr/lib/jvm/jre-jetbrains
      export PYCHARM_JDK=/usr/lib/jvm/jre-jetbrains
      export RUBYMINE_JDK=/usr/lib/jvm/jre-jetbrains
      export CL_JDK=/usr/lib/jvm/jre-jetbrains
      export DATAGRIP_JDK=/usr/lib/jvm/jre-jetbrains
      export GOLAND_JDK=/usr/lib/jvm/jre-jetbrains
      export STUDIO_JDK=/usr/lib/jvm/jre-jetbrains


export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="$( echo $(which nvim) || echo $(which vim) || echo $(which vi) )"
else
  export EDITOR="$( echo $(which nvim) || echo $(which vim) || echo $(which vi) )"
fi

## OH_MY
ZSH_THEME="robbyrussell"
plugins=(git npm zsh-autosuggestions zsh-syntax-highlighting)

## SOURCE

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

## ALIAS

alias vim='nvim'
alias cat="bat"
alias find-file="find . -type f -name"              ## Find a file with the given name
## Find a file & open it with neovim
alias ff='nvim $(fzf)'
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vim=nvim
alias mouse=piper
alias doc=zathura
alias calendar=calcurse
alias vim=nvim
alias vi=nvim
alias top=btop
alias nitrogen="nitrogen $HOME/wallpapers"
alias i3conf="vim $HOME/.config/i3/config"
alias ls='lsd'
alias grep="rg --color=auto"




