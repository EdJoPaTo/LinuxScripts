echo "settings…"
echo "         gedit…"
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
# gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'
gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor syntax-highlighting true
echo "         calculator…"
gsettings set org.gnome.calculator button-mode 'programming'
echo "         nautilus…"
# dconf write /org/gnome/nautilus/preferences/executable-text-activation "'ask'"
echo "         natural scrolling…"
dconf write /org/gnome/settings-daemon/peripherals/touchpad/natural-scroll true
dconf write /org/gnome/desktop/peripherals/touchpad/natural-scroll true
dconf write /org/gnome/desktop/peripherals/touchpad/tap-to-click true
echo "         terminal…"
dconf write /org/gnome/terminal/legacy/menu-accelerator-enabled false
dconf write /org/gnome/terminal/legacy/default-show-menubar false
dconf write /org/gnome/terminal/legacy/theme-variant "'dark'"
echo "         privacy…"
dconf write /org/gnome/desktop/privacy/remove-old-trash-files true
dconf write /org/gnome/desktop/privacy/remove-old-temp-files true
dconf write /org/gnome/desktop/privacy/old-files-age 30
dconf write /org/gnome/desktop/privacy/recent-files-max-age 7
echo "         extensions…"
dconf write /org/gnome/shell/calendar/show-weekdate true
echo "                    system-monitor…"
dconf write /org/gnome/shell/extensions/system-monitor/disk-usage-style "'bar'"
dconf write /org/gnome/shell/extensions/system-monitor/icon-display false

echo "folders…"
mkdir -p ~/bin
mkdir -p ~/Documents/git/gist
mkdir -p ~/Documents/git/haw
mkdir -p ~/Documents/git/home
mkdir -p ~/Documents/git/other
