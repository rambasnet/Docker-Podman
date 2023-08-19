#!/bin/bash

show_rsa_pub_key() {
  echo "Copy the following .ssh/id_rsa.pub to github"
  cat .ssh/id_rsa.pub
  echo "Run the script again as following from docker container:"
  echo "$ bash $0"
}

eval $(ssh-agent)
if [ -f .ssh/id_rsa ]; then
  ssh-add .ssh/id_rsa
  if ssh -o StrictHostKeyChecking=no -T git@github.com 2>&1 | grep -q "successfully authenticated";
  then
    echo "public ssh key added in github and successfully authenticated..."
  else
    show_rsa_pub_key
  fi
else
  echo "generating new ssh key pairs..."
  mkdir .ssh
  ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa -q -N ""
  show_rsa_pub_key
fi
