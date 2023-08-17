eval $(ssh-agent)
if [ -f .ssh/id_rsa ]; then
  ssh-add .ssh/id_rsa
  if ssh -o StrictHostKeyChecking=no -T git@github.com 2>&1 | grep -q "successfully authenticated";
  then
    echo "public ssh key added in github and successfully authenticated..."
  else
    echo "copy the following .ssh/id_rsa.pub to github"
    cat .ssh/id_rsa.pub
    echo "Run the script again after you have added the key"
  fi
else
  echo "generating new .ssh keys"
  mkdir .ssh
  ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa -q -N ""
  cat .ssh/id_rsa.pub
  echo "Copy and paste above key to github"
  echo "Run the script again after you have added the key to github..."
  echo "$ bash $0"
fi
