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

# parallel make (https://github.com/leyrer/linux-home/blob/master/zshrc#L93-L95)
export NUMCPUS=`grep -c '^processor' /proc/cpuinfo`
alias pmake='time nice make -j $NUMCPUS --load-average=$NUMCPUS'

alias grep='grep --color'
alias ls="exa"

alias fd='find . -type d -name'
alias ff='find . -type f -name'
