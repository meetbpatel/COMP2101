#!/bin/bash
#
# this script displays some host identification information for a Linux machine
#
# Sample output:
#   Hostname      : zubu
#   LAN Address   : 192.168.2.2
#   LAN Name      : net2-linux
#   External IP   : 1.2.3.4
#   External Name : some.name.from.our.isp

# the LAN info in this script uses a hardcoded interface name of "eno1"
#    - change eno1 to whatever interface you have and want to gather info about in order to test the script

# TASK 1: Accept options on the command line for verbose mode and an interface name - must use the while loop and case command as shown in the lesson - getopts not acceptable for this task
#         If the user includes the option -v on the command line, set the variable $verbose to contain the string "yes"
#            e.g. network-config-expanded.sh -v
#         If the user includes one and only one string on the command line without any option letter in front of it, only show information for that interface
#            e.g. network-config-expanded.sh ens34
#         Your script must allow the user to specify both verbose mode and an interface name if they want
# TASK 2: Dynamically identify the list of interface names for the computer running the script, and use a for loop to generate the report for every interface except loopback - do not include loopback network information in your output

################
# Data Gathering
################
# the first part is run once to get information about the host
# grep is used to filter ip command output so we don't have extra junk in our output
# stream editing with sed and awk are used to extract only the data we want displayed

#####
# Once per host report
#####
#if user run file name only they will get all summury identification in whole summury otherwise if they want command line argument then they will het output in just single line not in whole summury
if [ $# != 0 ]; then
while [ $# != 0 ] ; do
    case $1 in
        '-h') my_hostname="$(hostname) / $(hostname -I)"; echo "Hostname: $my_hostname" ;;
        '-i') interface=$(ls /sys/class/net); echo "These are the interfaces available in the system -> $interface" ;;
        '-dr') default_router_address="$(ip r s default| awk '{print $3}')"; echo "Default Router: $default_router_address" ;;
        '-drn') default_router_name="$(getent hosts ip r s default| awk '{print $3}'|awk '{print $2}')"; echo "Router Name: $default_router_name" ;;
        '-eip') external_address="$(curl -s icanhazip.com)"; echo "External IP   : $external_address" ;;
        '-eipn') external_name="$(getent hosts curl -s icanhazip.com | awk '{print $2}')"; echo "External Name : $external_name" ;;
        '-v') VERBOSE=1; echo "VERBOSE mode is on" ;;
        '-n') NUMBER=$2; echo "NUMBER is $NUMBER"; shift ;;
        * ) break ;;
    esac
    shift
done
else
#[ "$verbose" = "yes" ] && echo "Gathering host information"
# we use the hostname command to get our system name and main ip address
my_hostname="$(hostname) / $(hostname -I)"

#[ "$verbose" = "yes" ] && echo "Identifying default route"
# the default route can be found in the route table normally
# the router name is obtained with getent
default_router_address=$(ip r s default| awk '{print $3}')
default_router_name=$(getent hosts $default_router_address|awk '{print $2}')

#[ "$verbose" = "yes" ] && echo "Checking for external IP address and hostname"
# finding external information relies on curl being installed and relies on live internet connection
external_address=$(curl -s icanhazip.com)
external_name=$(getent hosts $external_address | awk '{print $2}')
cat <<EOF

System Identification Summary
=============================
Hostname      : $my_hostname
Default Router: $default_router_address
Router Name   : $default_router_name
External IP   : $external_address
External Name : $external_name

EOF

fi
#####
# End of Once per host report
#####

# the second part of the output generates a per-interface report
# the task is to change this from something that runs once using a fixed value for the interface name to
#   a dynamic list obtained by parsing the interface names out of a network info command like "ip"
#   and using a loop to run this info gathering section for every interface found

# the default version uses a fixed name and puts it in a variable
#####
# Per-interface report
#####

# define the interface being summarized
#in=$(ls /sys/class/net)
#echo "$in"
#Print all available interfaces without loopback so user can insert it's name so the user can get the other information of that interface
#inn=$(ip -j link |jq -r '.[].ifname | select(. != "lo")') 
#echo "By default it is showing information of ens33 but if you want to see other interface's information then you can get the information by giving it's name: $inn"

temp=1
while [ $temp > 0 ]
do

opt=$(ip -j link |jq -r '.[].ifname | select(. != "lo")')
tempString=$opt;
interfaces=(`echo $tempString | tr ' ' ' '`)
for inter in "${interfaces[@]}"
do
    printf "$inter\n"
done

echo "Choose an option:"
select i in ${inter[@]}
do
        case $i in
                        ${inter[0]})
                                interface="ens33"
                                ipv4_address=$(ip a s $interface|awk -F '[/ ]+' '/inet /{print $3}')
				ipv4_hostname=$(getent hosts $ipv4_address | awk '{print $2}')
				
				network_address=$(ip route list dev $interface scope link|cut -d ' ' -f 1)
				network_number=$(cut -d / -f 1 <<<"$network_address")
				network_name=$(getent networks $network_number|awk '{print $1}')
					

				echo "Interface $interface:"
				echo "==============="
				echo "Address         : $ipv4_address"
				echo "Name            : $ipv4_hostname"
				echo "Network Address : $network_address"
				echo "Network Name    : $network_name"
				
                                ;;
                        ${inter[1]})
                                interface="lxdbr0"
                                ipv4_address=$(ip a s $interface|awk -F '[/ ]+' '/inet /{print $3}')
				ipv4_hostname=$(getent hosts $ipv4_address | awk '{print $2}')
				
				network_address=$(ip route list dev $interface scope link|cut -d ' ' -f 1)
				network_number=$(cut -d / -f 1 <<<"$network_address")
				network_name=$(getent networks $network_number|awk '{print $1}')
					

				echo "Interface $interface:"
				echo "==============="
				echo "Address         : $ipv4_address"
				echo "Name            : $ipv4_hostname"
				echo "Network Address : $network_address"
				echo "Network Name    : $network_name"
                                ;;
                        ${inter[2]})
                                interface="vethc3fbce9e"
                                ipv4_address=$(ip a s $interface|awk -F '[/ ]+' '/inet /{print $3}')
				ipv4_hostname=$(getent hosts $ipv4_address | awk '{print $2}')
				
				network_address=$(ip route list dev $interface scope link|cut -d ' ' -f 1)
				network_number=$(cut -d / -f 1 <<<"$network_address")
				network_name=$(getent networks $network_number|awk '{print $1}')
					

					echo "Interface $interface:"
					echo "==============="
					echo "Address         : $ipv4_address"
					echo "Name            : $ipv4_hostname"
					echo "Network Address : $network_address"
					echo "Network Name    : $network_name"
                                ;;
                        *)
                                echo "invalid option"
                                ;;
        esac
done

done
#####
# End of per-interface report
#####
