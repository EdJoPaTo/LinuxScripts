# Arch Linux Mobile Appliance

see https://github.com/r-darwish/alma

## Create image

run `./create-image.sh`

## Put image on a stick

When satisfied use `doas dd if=alma.img of=/dev/sd# bs=4k` to flash the image to the stick.
In my case this was `/dev/sdb` or `/dev/sdc`.
`doas progress -m` is helpful for watching the progress of tools like dd.

### Resize partition

Source: https://superuser.com/questions/660309/live-resize-of-a-gpt-partition-on-linux/1156509#1156509

```bash
doas sgdisk -e /dev/sdc

doas sgdisk -d 3 /dev/sdc
doas sgdisk -N 3 /dev/sdc

doas partprobe /dev/sdc

doas resize2fs /dev/sdc3
```
