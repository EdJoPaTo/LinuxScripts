# Aliases
export EDITOR=nano
export VISUAL=nano

export PATH=$HOME/bin:$PATH

# Pager
export PAGER="less"
export LESS="--RAW-CONTROL-CHARS"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias grep='grep --color'
alias ls="exa"

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias youtube-dl-mp3='nice youtube-dl --write-all-thumbnails --add-metadata --embed-thumbnail -k -x --audio-format mp3'

alias init-nvm='source /usr/share/nvm/init-nvm.sh'
alias npm-reinstall='rm -rf node_modules package-lock.json && nice npm i && npm outdated'
alias typescript-watch='rm -rf dist && npx tsc --sourceMap --pretty -w'
