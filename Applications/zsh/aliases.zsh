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

# example usage: `gitBelow fetch`
gitBelow() {
	find . -name ".git" -type d -print -execdir git $@ \;
}

alias svg2png='inkscape --export-type=png'
alias svg2pdf='inkscape --export-type=pdf'

# https://github.com/chubin/wttr.in
alias wttr='curl wttr.in && curl v2.wttr.in'
alias wttr-short='curl "wttr.in/?format=%l:+%c+%t,+%w+%m"'

alias mpc-clearadd='mpc clear && mpc add'

alias ffmpegGif='nice ffmpeg -v error -stats -an'
alias ffmpegSound='nice ffmpeg -v error -stats -vn'
alias ffmpegVideo='nice ffmpeg -v error -stats'

alias eyeD3='eyeD3 --preserve-file-times'
alias youtube-dl-mp3='nice youtube-dl --write-all-thumbnails --add-metadata --embed-thumbnail -k -x --audio-format mp3'

alias cargo-buildcheck='nice cargo build && nice cargo clippy && nice cargo test -q && nice cargo fmt -- --check'

alias init-nvm='source /usr/share/nvm/init-nvm.sh'
alias npm-reinstall='rm -rf node_modules package-lock.json && nice npm i && npm outdated'
alias typescript-watch='rm -rf dist && nice npx tsc --sourceMap --pretty --watch'

mqtt-home() {
	# TODO: detect if $2 is unset and subscribe then instead
	mosquitto_pub -h etoPiHome1 -t "$1" -m "$2"
}

alias mqtt-home-plug-nuc-on='mqtt-home espPowerstrip-et/set/plug4/on 1'
alias mqtt-home-plug-windoof-on='mqtt-home espPowerstrip-et/set/plug2/on 1'

alias rsynca='rsync --archive --verbose --checksum --delete-delay'

remotedebug() {
	# usage: remotedebug server command which should be executed
	# usage: remotedebug my.server.tld cargo build
	server=$1
	shift 1

	folder=${PWD##*/}
	remotefolder="tmp/remotedebug/$folder/"

	rsync --archive --cvs-exclude --exclude-from=.gitignore --verbose --checksum --rsync-path="mkdir -p $remotefolder && rsync" --delete-delay . $server:$remotefolder
	ssh -tt $server "cd $remotefolder && bash -cl '$@'"
}
