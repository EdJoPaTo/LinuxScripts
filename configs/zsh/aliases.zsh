# Aliases

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# ZSH Static named directories (~templates can be used then)
hash -d templates=~/git/hub/template

[ -f /usr/local/opt/nvm/nvm.sh ] && alias nvm='unalias nvm && source /usr/local/opt/nvm/nvm.sh && nvm'
[ -f /usr/share/nvm/init-nvm.sh ] && alias nvm='unalias nvm && source /usr/share/nvm/init-nvm.sh && nvm'
