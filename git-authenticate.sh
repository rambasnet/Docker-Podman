#!/bin/bash

show_rsa_pub_key() {
  echo "Couldn't authenticate with GitHub. Make sure public key is copied to GitHub."
  echo "Copy the following .ssh/id_rsa.pub to GitHub"
  cat .ssh/id_rsa.pub
  echo "Run the script again as following from docker container:"
  echo "$ bash $0"
}

eval $(ssh-agent)
if [ -f .ssh/id_rsa ]; then
    ssh-add .ssh/id_rsa
    ssh -o StrictHostKeyChecking=no -T git@github.com &>  /dev/null
    if [ $? == 0]; then
        if ssh -o StrictHostKeyChecking=no -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
            echo "public ssh key added in github and successfully authenticated..."
        else
            show_rsa_pub_key
        fi
    else
        show_rsa_pub_key
    fi
else
    echo "generating new ssh key pairs..."
    mkdir .ssh
    ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa -q -N ""
    show_rsa_pub_key
fi
