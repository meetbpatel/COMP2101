#!/bin/bash
#Student Name: Meet Bharatbhai Patel
#Student Number: 200465967


hs=$(hostname)
echo "Host name: $hs"

dn=$(hostname --d)
echo "Domain name: $dn"

un=$(uname)
unv=$(uname -r)
echo -e "Operating System name and version: \n$un and $unv"

ip=$(hostname -I)
echo "IP Address: $ip"

fs=$(df -Th | grep "^/dev")
echo "$fs"
