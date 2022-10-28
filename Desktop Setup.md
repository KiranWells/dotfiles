# Desktop Setup

## Arch Linux Install

cryptsetup arguments:

```
cryptsetup --perf-no_read_workqueue --perf-no_write_workqueue --allow-discards --persistent open /dev/[device] root
```

brtfs arguments
```
compress=zstd:3,discard=async
```

Make sure to create a subvolume for Documents for snapshotting

pacstrap:
```
pacstrap /mnt base linux linux-firmware btrfs-progs networkmanager neovim man-db man-pages base-devel git
```

mkinitcpio hooks:

```
MODULES=(amdgpu)
HOOKS="base udev autodetect modconf block keyboard keymap plymouth filesystems fsck"
HOOKS=(base systemd autodetect modconf kms block keyboard sd-vconsole sd-plymouth sd-encrypt filesystems fsck)
```

hibernation:

create a subvolume for it
disable COW on the volume

```
chattr +C /subvolume
```

create a 32GB swap file in the volume

setup hibernation into swap file:
https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation_into_swap_file

## Packages

Insall yay:

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

install packages in kiran-config

## Configuration

Configure zsh as shell
Configure autologin on tty1
https://wiki.archlinux.org/title/Getty#Automatic_login_to_virtual_console
configure x autostart at login
https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login

install configs from the rose theme