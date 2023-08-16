eval $(ssh-agent)
if [ -d .ssh ]; then
  ssh-add .ssh/id_rsa
  ssh -o StrictHostKeyChecking=no -T git@github.com
else
  echo "generating new .ssh keys"
  mkdir .ssh
  ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa -q -N ""
  cat .ssh/id_rsa.pub
  echo "Copy and paste above key to github"
  echo "Run the script again after you have added the key"
fi
