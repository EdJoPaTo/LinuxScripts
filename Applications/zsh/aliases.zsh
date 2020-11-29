# Aliases
export EDITOR=nano
export VISUAL=nano

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin

# Pager
export PAGER="less"
export LESS="--RAW-CONTROL-CHARS"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Add arguments to commands (like default arguments)
alias grep='grep --color'
alias ls="exa --git"
alias tokei='tokei --sort code'

# example usage: `gitBelow fetch`
gitBelow() {
	find . -name ".git" -type d -print -execdir git $@ \;
}

alias svg2png='inkscape --export-type=png'
alias svg2pdf='inkscape --export-type=pdf'

# https://github.com/chubin/wttr.in
alias wttr='curl wttr.in && curl v2.wttr.in'
alias wttr-short='curl "wttr.in/?format=%l:+%c+%t,+%w+%m"'

alias mpc-clearadd='mpc clear -q && mpc add'

alias ffmpegGif='nice ffmpeg -v error -stats -an'
alias ffmpegSound='nice ffmpeg -v error -stats -vn'
alias ffmpegVideo='nice ffmpeg -v error -stats'

alias eyeD3='eyeD3 --preserve-file-times'
alias youtube-dl-mp3='nice youtube-dl --write-all-thumbnails --add-metadata --embed-thumbnail -k -x --audio-format mp3'

alias docker-prune='docker container prune -f && docker volume prune -f && docker image prune -f'

alias cargo-dev='nice cargo watch --clear --exec clippy --exec "fmt -- --check || true" --exec "test -q" --exec build --exec "clippy --all-targets"'
alias cargo-pedantic='touch src/*.rs && nice cargo clippy --all-targets -- -W clippy::pedantic && nice cargo build --all-targets && nice cargo test -q && nice cargo fmt -- --check'
cargoBelow() {
	find . -name "Cargo.toml" -type f -print -execdir nice cargo $@ \;
}

alias init-nvm='source /usr/share/nvm/init-nvm.sh'
alias npm-reinstall='rm -rf node_modules package-lock.json && nice npm i && npm outdated'
alias npmBelow-clean='fd --type f package.json --threads 1 --exec rm -rf {//}/node_modules'
alias typescript-watch='rm -rf dist && nice npx tsc --sourceMap --pretty --watch'

alias pio-upload-monitor='pio run --target upload && pio device monitor'

alias mqttui-home='mqttui -h etoPiHome1'
alias mqtt-home-plug-nuc-on='mqttui-home espPowerstrip-et/set/plug4/on 1'
alias mqtt-home-plug-windoof-on='mqttui-home espPowerstrip-et/set/plug2/on 1'

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
