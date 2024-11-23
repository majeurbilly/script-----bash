#!/bin/bash
(echo "billy" ; echo "halle" ; echo "bh") | bash ./NewUser.sh >> ./testLog.txt
cat ./testLog.txt
sudo deluser --remove-all-files "billy"