set -g fish_autosuggestion_enabled 0

function fish_greeting
	uptime
end

starship init fish | source
