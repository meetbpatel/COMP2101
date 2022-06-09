#!/bin/bash
#Student Name: Meet Bharatbhai Patel
#Student Number: 200465967

hs=$(hostname)
un=$(uname)
unv=$(uname -r)
ip=$(hostname -I)
fs=$(du -sh)

cat <<EOF

Report for myvm($hs)
=========================
FQDN: $hs
Operating System name and version: $un and $unv
IP Address: $ip
Root Filesystem Free Space: $fs
=========================
EOF
