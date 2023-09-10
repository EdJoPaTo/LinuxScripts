# Aliases
type helix >/dev/null && export EDITOR=helix
type helix >/dev/null && export VISUAL=helix
type hx >/dev/null && export EDITOR=hx
type hx >/dev/null && export VISUAL=hx

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin

export BAT_THEME=ansi
export FZF_DEFAULT_COMMAND="rg --files"
export LESS="--RAW-CONTROL-CHARS --quit-if-one-screen --ignore-case"
export MEETING_PIXELMATRIX=espMatrix-etHorizontal:1337
export MQTTUI_BROKER=mqtt://etoPiHome1

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# ZSH Static named directories (~templates can be used then)
hash -d templates=~/git/hub/template

alias cdf='cd "$(fd --type=directory | fzf)"'
alias cdg='cd ~/git && cd "$(project-below --directory=.git --list | rg -v archived\/ | fzf)"'
alias cdga='cd ~/git && cd "$(project-below --directory=.git --list | fzf)"'

alias gitrepodir='git rev-parse --show-toplevel'
alias cdrepo='cd $(gitrepodir)'

alias brew='nice brew'
alias cargo='nice cargo'
alias code='nice -n 5 code'
alias edc='nice edc'
alias esphome='nice esphome'
alias makepkg='nice makepkg'
alias npm='nice npm'
alias paru='nice paru'
alias pio='nice pio'
alias platformio='nice platformio'
alias podman='nice podman'
alias rustup='nice rustup'

# platform independent commands between macOS and Arch Linux
type codium >/dev/null && alias code='nice -n 5 codium'
type helix >/dev/null && alias hx='helix'
type xdg-open >/dev/null && alias open='xdg-open'

# Help to migrate to new commands (space at start -> no history entry)
type doas >/dev/null && alias sudo=' echo use doas && false --'
type rg >/dev/null && alias grep=' echo use rg && false --'
type fx >/dev/null && alias jq='echo consider fx for jq && jq'

# Add default arguments to commands (which are then always used)
alias ffmpeg='nice -n 15 ffmpeg -stats -hide_banner'
alias ip='ip --color=auto'
alias systemctl='systemctl --no-pager --full'
alias tokei='tokei --sort code'
alias yt-dlp='nice -n 15 yt-dlp --prefer-free-formats --embed-subs --sub-langs all --embed-thumbnail --embed-metadata --embed-chapters --video-multistreams --audio-multistreams --sponsorblock-remove default'
type exa >/dev/null && alias ls='exa --git'

alias ffmpegGif='ffmpeg -an'
alias ffmpegSound='ffmpeg -vn'
alias httpserver='python -m http.server' # usage: httpserver <port>
alias randb='openssl rand -base64 33'
alias randh='openssl rand -hex 20'
alias rsynca='rsync --verbose --compress --checksum --delete-delay --archive'
alias rsyncc='rsync --verbose --compress --recursive --links --copy-unsafe-links --times'
alias ssh-force-password='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias svg2pdf='inkscape --export-type=pdf'
alias svg2png='inkscape --export-type=png'
alias tss='ts "%H:%M:%.S"'
alias yt-dlp-mp3='yt-dlp --extract-audio --audio-format mp3'
alias yt-dlp-720='yt-dlp --format "bestvideo[height<=720]+bestaudio"'

# https://github.com/chubin/wttr.in
alias wttr='curl wttr.in && curl v2.wttr.in'
alias wttr-short='curl "wttr.in/?format=%l:+%c+%t,+%w+%m"'

alias mpc-clearadd='mpc clear -q && mpc add'
alias mpc-cropadd='mpc crop && mpc add'
alias amp='mpc --host etoPiAmp'

# example usage: `gitBelow fetch`
# see: https://github.com/EdJoPaTo/project-below
alias gitBelow='project-below --directory=.git git'
alias gitSubmoduleBelow='project-below --file=.git git'

# --bind 0.0.0.0 when testing with devices on the same network
alias hugo-serve='hugo server -p 4200 --buildDrafts --buildFuture'

alias podman-image-update='nice podman pull $(podman image ls --filter=dangling=false --noheading --format="{{.Repository}}:{{.Tag}}" | rg -v localhost)'
alias podmanBelow='project-below --file=Dockerfile nice -n 19 podman'

export CROSS_CONTAINER_ENGINE=podman
alias cargo-open-doc='nice cargo doc --open --all-features'
alias cargoBelow='project-below --file=Cargo.toml nice -n 19 cargo'
alias cargoLibBelow='project-below --file=src/lib.rs nice -n 19 cargo'
# See lints: https://rust-lang.github.io/rust-clippy/stable/index.html
# Restriction lints are listed individually

cat /usr/local/opt/nvm/nvm.sh &>/dev/null && alias nvm='unalias nvm && source /usr/local/opt/nvm/nvm.sh && nvm'
cat /usr/share/nvm/init-nvm.sh &>/dev/null && alias nvm='unalias nvm && source /usr/share/nvm/init-nvm.sh && nvm'
alias npx='echo edjopato fixed npx again && PATH=$(pwd)/node_modules/.bin:$PATH nice'
alias npm-reinstall='rm -rf node_modules package-lock.json && nice npm install && npm outdated || true'
alias npm-xo-update='npm install --save-dev xo@latest && npm-reinstall && nice ./node_modules/.bin/xo --fix'
alias typescript-watch='rm -rf dist && nice ./node_modules/.bin/tsc --sourceMap --pretty --watch'
alias npmBelow='project-below --file=package.json nice -n 19 npm'
alias npmBelow-clean='project-below --file=package.json --directory=node_modules rm -rf node_modules'
alias tscBelow-clean='project-below --file=tsconfig.json --directory=dist rm -rf dist'
alias npmBelow-ci='project-below --file=package.json nice -n 19 bash -c "rm -rf node_modules package-lock.json; git checkout package-lock.json; npm ci || npm i"'

alias denoBelow='project-below --file=deno.jsonc deno'

alias pio-upload='pio run --target upload'
alias pio-monitor='pio device monitor'
alias pioBelow='project-below --file=platformio.ini nice -n 19 pio'
alias pioBelow-clean='project-below --file=platformio.ini --directory=.pio rm -rf .pio'
