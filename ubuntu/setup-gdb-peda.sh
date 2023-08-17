#!/bin/bash

# setup gdb
cat gdb.config >> ~/.gdbinit
# install peda for gdb
# check if peda is cloned
if [ ! -d ./peda ]
then
    echo "Installing peda"
    git clone https://github.com/longld/peda.git ./peda
fi
echo "source ./peda/peda.py" >> ~/.gdbinit
echo "peda installed..."
