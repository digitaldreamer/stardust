########
STARDUST
########

This is my attempt to organize my dotfiles and system settings.

VIRTUALBOX
##########

#. set up the following on the vbox::

    sudo apt-get install ssh
    sudo apt-get install -y virtualbox-guest-additions
    sudo apt-get install virtualbox-ose-guest-utils
    mkdir ~/cdrom
    sudo mount /dev/cdrom ~/cdrom
    ~/cdrom/VBoxLinuxAdditions.run

    sudo visudo
    %sudo   ALL=NOPASSWD: ALL

    # fstab depricated
    # sudo vim /etc/fstab
    # projects /home/<user>/projects vboxsf uid=1000,gid=1000 0 0

    # relink
    /sbin/mount.vboxsf -> /usr/lib/x86_64-linux-gnu/VBoxGuestAdditions/mount.vboxsf
    /etc/rc.local
    mount -t vboxsf -rw -o uid=1000,gid=1000 projects /home/<user>/projects

    # add line to file
    sudo vim /etc/modules
    vboxsf

    sudo reboot

#. run the following on the host to prep vbox: this will ask for your password twice and leave you logged into ssh on the vbox::

    cd ~/stardust/vbox
    ./start

#. the start script will copy some files to vbox and ssh as the last step
   once complete run the following on vbox::

    ~/supernova
    cd ~/stardust
    make vbox

#.once the vbox has been built you will want to set up any configs

postgres::

    sudo vim /etc/postgresql/<version>/main/pg_hba.conf
    local   all             postgres                                trust

    sudo /etc/init.d/postgresql restart

SSH
####

ssh-keygen -t rsa -C "your_email@example.com"
