# These files were exported using [askubuntu](https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages)

The files were created by executing following commands inside the OSE iso using VirtualBox

```sh
dpkg --get-selections > ~/Package.list
sudo cp -R /etc/apt/sources.list* ~/
sudo apt-key exportall > ~/Repo.keys
```

These commands are used to restore the contents inside the docker container

```sh
sudo apt-key add ~/Repo.keys
sudo cp -R ~/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < ~/Package.list
sudo apt-get dselect-upgrade -y
```
