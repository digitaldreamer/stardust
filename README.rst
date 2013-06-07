######
README
######

This is my attempt to organize my dotfiles and system settings.

######
SYSTEM

sudo apt-get install ssh
mkdir projects
sudo mount /dev/cdrom ~/projects

sudo visudo
%sudo   ALL=NOPASSWD: ALL

sudo vim /etc/fstab
projects /home/poyzer/projects vboxsf uid=1000,gid=1000 0 0

####
SSH

ssh-keygen -t rsa -C "your_email@example.com"
