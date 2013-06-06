######
README
######

This is my attempt to organize my dotfiles and system settings.

######
SYSTEM

mkdir projects
#sudo apt-get install virtualbox-guest-additions
sudo apt-get install ssh
mkdir projects
sudo mount /dev/cdrom ~/projects

ssh keys
git config --global user.name username
git config --global user.email "user@example.com"
git config --global color.ui true

sudo visudo
%sudo   ALL=NOPASSWD: ALL
sudo apt-get install git-core -y

sudo vim /etc/fstab
projects /home/poyzer/projects vboxsf uid=1000,gid=1000 0 0

####
SSH

ssh-keygen -t rsa -C "your_email@example.com"
