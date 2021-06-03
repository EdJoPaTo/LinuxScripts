# Aliases
export EDITOR=nano
export PAGER=less
export VISUAL=nano

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin

export LESS="--RAW-CONTROL-CHARS"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Add arguments to commands (like default arguments)
alias grep='grep --color'
alias ls="exa --git"
alias tokei='tokei --sort code'

# Help to migrate to new commands (space at start -> no history entry)
type doas > /dev/null && alias sudo=' echo use doas && false &&'
type ss > /dev/null && alias netstat=' echo use ss && false &&'

# example usage: `gitBelow fetch`
gitBelow() {
	find . -name ".git" -type d -print -execdir git --no-pager $@ \;
}

alias svg2png='inkscape --export-type=png'
alias svg2pdf='inkscape --export-type=pdf'

# https://github.com/chubin/wttr.in
alias wttr='curl wttr.in && curl v2.wttr.in'
alias wttr-short='curl "wttr.in/?format=%l:+%c+%t,+%w+%m"'

alias mpc-clearadd='mpc clear -q && mpc add'
alias amp='mpc --host etoPiAmp'

alias ffmpegGif='nice ffmpeg -v error -stats -an'
alias ffmpegSound='nice ffmpeg -v error -stats -vn'
alias ffmpegVideo='nice ffmpeg -v error -stats'

alias eyeD3='eyeD3 --preserve-file-times'
alias youtube-dl-mp3='nice youtube-dl --write-all-thumbnails --add-metadata --embed-thumbnail -k -x --audio-format mp3'

alias docker-prune=' echo use docker system prune --volumes -f'
alias podman-prune=' echo use podman system prune --volumes -f'

alias cargo-dev='nice cargo watch --clear --exec "clippy -- -W clippy::pedantic" --exec "fmt -- --check || true" --exec "build --all-targets" --exec "test -q"'
alias cargo-pedantic='touch **/src/*.rs && nice cargo clippy --all-targets -- -W clippy::pedantic && nice cargo build --all-targets && nice cargo test -q && nice cargo fmt -- --check'
cargoBelow() {
	find . -name "Cargo.toml" -type f -print -execdir nice cargo $@ \;
}

alias npx='echo edjopato fixed npx again && PATH=$(pwd)/node_modules/.bin:$PATH'
alias init-nvm='source /usr/share/nvm/init-nvm.sh'
alias npm-reinstall='rm -rf node_modules package-lock.json && nice npm i && npm outdated'
alias npmBelow-clean='fd --type f package.json --threads 1 --exec rm -rf {//}/node_modules'
alias typescript-watch='rm -rf dist && nice ./node_modules/.bin/tsc --sourceMap --pretty --watch'

alias pio-upload-monitor='pio run --target upload && pio device monitor'

alias led-matrix-remote-et-decke='led-matrix-remote mqtt --broker etoPiHome1 --base-topic espMatrixEtDecke'
alias mqttui-home='mqttui --broker etoPiHome1'

alias rsynca='rsync --archive --compress --verbose --checksum --delete-delay'

remotedebug() {
	# usage: remotedebug server command which should be executed
	# usage: remotedebug my.server.tld cargo build
	server=$1
	shift 1

	folder=${PWD##*/}
	remotefolder="tmp/remotedebug/$folder/"

	rsync --archive --compress --verbose --checksum --delete-delay --exclude=.git --exclude-from=.gitignore --rsync-path="mkdir -p $remotefolder && rsync" . $server:$remotefolder
	ssh -tt $server "uptime && cd $remotefolder && bash -cl '$@' && uptime"
}
