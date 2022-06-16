#!/bin/bash

ip a | grep -q lxdbr0 && echo "found" || echo "not found"
lxc launch images:ubuntu/20.04 COMP2101-S22
read -p "Enter IP address: " ipad
read -p "Enter Name: " ipnam
sed -i.bkp "$ a \$ipnam  \$ipad" /etc/hosts 

lxc exec COMP2101-S22 apt update
lxc exec COMP2101-S22 apt install apache2
