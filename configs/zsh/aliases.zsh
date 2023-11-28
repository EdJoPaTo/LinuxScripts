# Aliases

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# ZSH Static named directories (~templates can be used then)
hash -d templates=~/git/hub/template

cat /usr/local/opt/nvm/nvm.sh &>/dev/null && alias nvm='unalias nvm && source /usr/local/opt/nvm/nvm.sh && nvm'
cat /usr/share/nvm/init-nvm.sh &>/dev/null && alias nvm='unalias nvm && source /usr/share/nvm/init-nvm.sh && nvm'
