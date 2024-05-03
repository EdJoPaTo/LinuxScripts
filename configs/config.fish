set -g fish_autosuggestion_enabled 0

function fish_greeting
	fish_config theme choose 'ayu Dark' # requires fish 3.4
	uptime
end

source ~/.config/aliases
source ~/.config/env

starship init fish | source
