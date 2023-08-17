#!/bin/bash

# setup gdb
# Intel syntax is more readable
echo "set disassembly-flavor intel" >> ~/.gdbinit

# When inspecting large portions of code the scrollbar works better than 'less'
echo "set pagination off" >> ~/.gdbinit

# Keep a history of all the commands typed. Search is possible using ctrl-r
echo "set history save on" >> ~/.gdbinit
echo "set history filename ./.gdb_history" >> ~/.gdbinit
echo "set history size 32768" >> ~/.gdbinit
echo "set history expansion on" >> ~/.gdbinit

# install peda for gdb
# check if peda is cloned
if [ ! -d ./peda ]
then
    echo "Installing peda"
    git clone https://github.com/longld/peda.git ./peda
fi
echo "source ./peda/peda.py" >> ~/.gdbinit
echo "peda installed..."
