######
README
######

This is my attempt to organize my dotfiles and system settings.

VIRTUALBOX
##########

set up the following on the vbox::

    sudo apt-get install ssh
    sudo mount /dev/cdrom ~/projects
    ~/projects/VBoxLinuxAdditions.run

    sudo visudo
    %sudo   ALL=NOPASSWD: ALL

    sudo vim /etc/fstab
    projects /home/poyzer/projects vboxsf uid=1000,gid=1000 0 0

    sudo reboot

run the following on the host to prep vbox::

    cd ~/dotfiles/vbox
    start

| the start script will copy some files to vbox and ssh as the last step
| once complete run the following on vbox::

    bootstrap
    cd ~/dotfiles
    make vbox

| once the vbox has been built you will want to set up any configs
|
| postgres::

    sudo vim /etc/postgresql/<version>/main/pg_hba.conf
    local   all             postgres                                trust

    sudo /etc/init.d/postgresql restart

SSH
####

ssh-keygen -t rsa -C "your_email@example.com"
