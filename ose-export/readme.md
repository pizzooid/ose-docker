# These files were exported using [askubuntu](https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages)

The files were created by executing following commands inside the OSE iso using VirtualBox

```sh
dpkg --get-selections > ~/Package.list
sudo cp -R /etc/apt/sources.list* ~/
sudo apt-key exportall > ~/Repo.keys
```

This command is used to mount the iso to mount the container must be started with
mknod /dev/loop2 -m0660 b 7 2
sudo mount -o loop /ose-iso/OSE-Linux-2.0-Beta.iso /mnt/mount-iso/

These commands are used to restore the contents inside the docker container

```sh
sudo apt-key add /from-vbox/ose-export/Repo.keys
sudo cp -R /from-vbox/ose-export/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < /from-vbox/ose-export/Package.list
sudo apt-get dselect-upgrade -y
```
