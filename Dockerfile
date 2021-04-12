FROM linuxmintd/mint20-amd64

# COPY OSE-Linux-2.0-Beta.iso /ose-iso/OSE-Linux-2.0-Beta.iso
COPY ose-repository /mnt/mount-iso
COPY ose-export /from-vbox/ose-export
# RUN sudo mkdir -p /mnt/mount-iso/
RUN sudo apt-key add /from-vbox/ose-export/Repo.keys && \
    sudo cp -R /from-vbox/ose-export/sources.list* /etc/apt/ && \
    sudo apt-get update && \
    sudo apt-get install dselect && \
    sudo dselect update && \
    sudo dpkg --set-selections < /from-vbox/ose-export/Package.list && \
    sudo apt-get dselect-upgrade -y