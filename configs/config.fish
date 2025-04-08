set -g fish_autosuggestion_enabled 0

function fish_greeting
	uptime
end

source ~/.config/aliases
source ~/.config/env

command -v starship >/dev/null 2>/dev/null && starship init fish | source
