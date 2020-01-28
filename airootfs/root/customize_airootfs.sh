#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/fish root
! id billie && useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /usr/bin/fish billie
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/# autologin=dgod/autologin=billie/' /etc/lxdm/lxdm.conf
sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

cd /tmp
sudo -u billie git clone https://aur.archlinux.org/flat-remix-gtk.git
sudo -u billie git clone https://aur.archlinux.org/flat-remix.git
cd /tmp/flat-remix-gtk
sudo -u billie makepkg
pacman -U --noconfirm flat-remix-gtk-*-any.pkg.tar.xz
cd /tmp/flat-remix
sudo -u billie makepkg
pacman -U --noconfirm flat-remix*any.pkg.tar.xz

systemctl enable pacman-init.service choose-mirror.service
systemctl enable NetworkManager.service
systemctl enable lxdm.service
systemctl set-default graphical.target
