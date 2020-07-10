## Script to connect to openvpn and use vpnbook
## config file, username, and password
##
## This script is built to automate the proxychains and tor service together for stronger anonymity!!!
##
##  Changes your external/public ip everytime you open and close the browser. 
##  Uses four different proxy servers to bounce off US,Canada,Europe,Germany.
##  
## Uses three nameservers from around the US to pass off and return quarries without using any ISP services.
## 

#! /bin/bash

#option rfc3442-classless-static-routes code 121 = array of unsigned integer 8;
#send host-name "andare.fugue.com";
#send host-name = gethostname();
#send dhcp-client-identifier 1:0:a0:24:ab:fb:9c;
#send dhcp-lease-time 3600;
#supersede domain-name "fugue.com home.vix.com";
# prepend domain-name-servers 208.67.222.222, 8.8.8.8, 4.2.2.1;
#request subnet-mask, broadcast-address, time-offset, routers,
#	domain-name, domain-name-servers, domain-search, host-name,
#	dhcp6.name-servers, dhcp6.domain-search,
#	netbios-name-servers, netbios-scope, interface-mtu,
#	rfc3442-classless-static-routes, ntp-servers;
#require subnet-mask, domain-name-servers;
#timeout 60;
#retry 60;
#reboot 10;
#select-timeout 5;
#initial-interval 2;
#script "/etc/dhcp3/dhclient-script";
#media "-link0 -link1 -link2", "link0 link1";
#reject 192.33.137.209;
#
#alias {
#  interface "eth0";
#  fixed-address 192.5.5.213;
#  option subnet-mask 255.255.255.255;
#}
#
#lease {
#  interface "eth0";
#  fixed-address 192.33.137.200;
#  medium "link0 link1";
#  option host-name "andare.swiftmedia.com";
#  option subnet-mask 255.255.255.0;
#  option broadcast-address 192.33.137.255;
#  option routers 192.33.137.250;
#  option domain-name-servers 127.0.0.1;
#  renew 2 2000/1/12 00:00:01;
#  rebind 2 2000/1/12 00:00:01;
#  expire 2 2000/1/12 00:00:01;
#}
##nameserver 208.67.222.222
##nameserver 8.8.8.8
##nameserver 4.2.2.1
clear
#COLOUR
red='\e[1;31m'
yellow='\e[0;33m'
Blue='\e[1;34m'
Reset='\e[0;0m'
title="HMFAO"
echo -e '\033]2;'$title'\007'
echo -e '\e[0m\e[3;39m-------------------------------
\e[3;31m Hide My Fucking Ass Online               
\e[0m\e[3;39m-------------------------------
(1)  Check Current Public IP
(2)  Proxychain Plus Tor
-------------------------------
       CTRL + C To Exit
-------------------------------
'

echo -e $Blue" ┌─["$red"HMFAO$Blue]──[$red~$Blue]─["$yellow"BETA$Blue]:"
echo -e $Blue" └─────► " ;read -p " Option: " n
case $n in
    1) myip="$(dig +short myip.opendns.com @resolver1.opendns.com)";echo "My WAN/Public IP address: ${myip}";;
    2) systemctl start tor.service; proxychains firefox "https://ipleak.net/";; 
    
esac
