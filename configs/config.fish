set -g fish_autosuggestion_enabled 0

function fish_greeting
	uptime
end

source ~/.config/aliases
source ~/.config/env

starship init fish | source
