#!/bin/bash

USER=user
PASSWORD=pass
# add a new user user:pass
useradd -m -s /bin/bash -p ${PASSWORD} ${USER}
# add user to sudo group
usermod -aG sudo ${USER}
# allow sudo without password
echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
cd /home/${USER}
echo export PATH='"'/app/bin:/app/bin/$(uname -s)-$(uname -m):/app:'${PATH}''"' >> /home/user/.bashrc


