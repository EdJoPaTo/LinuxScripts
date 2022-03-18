# Aliases
export EDITOR=nvim
export PAGER=less
export VISUAL=nvim

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin

export LESS="--RAW-CONTROL-CHARS"
export FZF_DEFAULT_COMMAND="rg --files"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias cdf='cd "$(fd --type=directory | fzf --preview="exa -a1 {}")"'
alias cdg='cd ~/git && cd "$(project-below --directory=.git --list | fzf --preview="exa -a1 {}")"'
alias cdc='cd ~/git && cd "$(project-below --file=Cargo.toml --list | fzf --preview="exa -a1 {}")"'
alias cdn='cd ~/git && cd "$(project-below --file=package.json --list | fzf --preview="exa -a1 {}")"'
alias cdp='cd ~/git && cd "$(project-below --file=platformio.ini --list | fzf --preview="exa -a1 {}")"'

# Add arguments to commands (like default arguments)
alias ls="exa --git"
alias tokei='tokei --sort code'

alias cargo='nice cargo'
alias edc='nice edc'
alias npm='nice npm'
alias pio='nice pio'
alias platformio='nice platformio'

# Help to migrate to new commands (space at start -> no history entry)
type bat > /dev/null && alias less=' echo use bat && false --'
type doas > /dev/null && alias sudo=' echo use doas && false --'
type nvim > /dev/null && alias nano=' echo use nvim && false --'
type nvim > /dev/null && alias vi=' echo use nvim && false --'
type nvim > /dev/null && alias vim=' echo use nvim && false --'
type rg > /dev/null && alias grep=' echo use rg && false --'
alias remotedebug=' echo use remoterun && false --'

# example usage: `gitBelow fetch`
# see: https://github.com/EdJoPaTo/project-below
alias gitBelow='project-below --directory=.git git'

alias randb='openssl rand -base64 33'
alias randh='openssl rand -hex 20'

alias tss='ts "%H:%M:%.S"'

alias svg2png='inkscape --export-type=png'
alias svg2pdf='inkscape --export-type=pdf'

# https://github.com/chubin/wttr.in
alias wttr='curl wttr.in && curl v2.wttr.in'
alias wttr-short='curl "wttr.in/?format=%l:+%c+%t,+%w+%m"'

alias mpc-clearadd='mpc clear -q && mpc add'
alias mpc-cropadd='mpc crop && mpc add'
alias amp='mpc --host etoPiAmp'

alias ffmpeg='nice -n 15 ffmpeg -stats -hide_banner'
alias ffmpegGif='ffmpeg -an'
alias ffmpegSound='ffmpeg -vn'

alias yt-dlp='nice -n 15 yt-dlp --prefer-free-formats --embed-subs --sub-langs all --embed-thumbnail --embed-metadata --embed-chapters --video-multistreams --audio-multistreams'
alias yt-dlp-mp3='yt-dlp --extract-audio --audio-format mp3'

alias podman-image-update='podman pull $(podman image ls --filter=dangling=false --noheading --format="{{.Repository}}:{{.Tag}}" | rg -v localhost)'
alias podmanBelow='project-below --file=Dockerfile podman'
alias website-stalker-below='project-below --file=website-stalker.yaml website-stalker'

alias cargo-open-doc='nice cargo doc --open --all-features'
alias cargo-dev='nice cargo watch --clear --exec "clippy --all-targets -- -W clippy::pedantic" --exec "fmt -- --check || true"'
alias cargo-dev-all='cargo-dev --exec "build --all-targets" --exec "test -q" --exec "doc --all-features"'
alias cargo-dev-build='cargo-dev --exec "build"'
alias cargo-dev-run='cargo-dev --exec "run"'
alias cargo-dev-test='cargo-dev --exec "build --tests" --exec "test -q"'
cargo-pedantic() {
	nice cargo clippy --all-targets "$@" -- -W clippy::pedantic -W clippy::nursery
	nice cargo build --all-targets "$@" \
	&& nice cargo test --all-targets --quiet "$@"
	nice cargo doc --all-features
	nice cargo fmt -- --check
}
alias cargoBelow='project-below --file=Cargo.toml nice -n 19 cargo'

alias npx='echo edjopato fixed npx again && PATH=$(pwd)/node_modules/.bin:$PATH nice'
alias nvm-init='source /usr/share/nvm/init-nvm.sh && unalias nvm-init'
alias npm-reinstall='rm -rf node_modules package-lock.json && nice npm install && npm outdated || true'
alias npm-xo-update='npm install --save-dev xo@latest && npm-reinstall && nice ./node_modules/.bin/xo --fix'
alias typescript-watch='rm -rf dist && nice ./node_modules/.bin/tsc --sourceMap --pretty --watch'
alias npmBelow='project-below --file=package.json nice -n 19 npm'
alias npmBelow-clean='project-below --file=package.json --directory=node_modules rm -rf node_modules'

alias pio-upload='pio run --target upload'
alias pio-monitor='pio device monitor'
alias pioBelow='project-below --file=platformio.ini nice -n 19 pio'
alias pioBelow-clean='project-below --file=platformio.ini --directory=.pio rm -rf .pio'

alias led-matrix-remote-et-decke='led-matrix-remote mqtt --broker etoPiHome1 --base-topic espMatrixEtDecke'
export MQTTUI_BROKER='etoPiHome1'

alias rsynca='rsync --verbose --compress --checksum --delete-delay --archive'
alias rsyncc='rsync --verbose --compress --checksum --recursive --links --times'
