#!/bin/bash

if [ $(whoami) != 'root' ]; then
	echo "Please run this script using sudo."
	exit
fi

echo -e "\n.....................INSTALLING DEDMAP..........................\n"
chmod +x dedmap
apt-get update
apt-get install python3 python3-pip figlet ping
read -p "Select python3 as default if it is not already from the menu below. Press anything to continue :- "
update-alternatives --config python
pip3 install -U pip
pip3 install -r requirements.txt
cp fonts/* /usr/lib/python3/dist-packages/pyfiglet/fonts/
cp fonts/* /usr/local/lib/python3/dist-packages/pyfiglet/fonts/
mkdir /usr/share/dedmap/
cp dedmap /usr/share/dedmap/
ln -s /usr/share/dedmap/dedmap /usr/bin/dedmap
echo -e "\n......................INSTALLATION FINISHED......................"
echo -e "\nThanks for installing dedmap.\nUse dedmap -h or --help for usage instructions.\n"
