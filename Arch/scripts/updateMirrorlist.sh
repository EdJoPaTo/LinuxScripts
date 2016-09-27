echo "Download Mirrorlist..."
wget -q -O /tmp/mirrorlist "https://www.archlinux.org/mirrorlist/?country=DE&protocol=https&ip_version=4&ip_version=6"
sed -i 's/^#Server/Server/' /tmp/mirrorlist
echo "Rank Mirrors..."
rankmirrors -n 6 /tmp/mirrorlist > /tmp/mirrorlist.new
cat /tmp/mirrorlist.new
rm /tmp/mirrorlist
echo "Backup old mirrorlist"
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Set new mirrorlist"
sudo mv /tmp/mirrorlist.new /etc/pacman.d/mirrorlist

echo "Download Updates with new Mirrorlist"
sudo pacman -Syyuw --noconfirm --noprogressbar
