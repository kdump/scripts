#!/bin/sh


########  NOTE:  DO NOT USE YET. IT'S A WORK IN PROGRESS  #######



#####   Purpose of this script:  To update tunnelbroker.net free IPv6 tunnels
#####        for those who use dynamic IPv4 (like ADSL) for Internet
#####        This script also update client side tunnel interface using his/her new IPv4 addr

#######  HE tunnel broker account info  ##########
#######  update them according to your info  #####
tunnel_user=username
tunnel_pass=password
tunnel_id1=xxxxxx

#######  tunnel update URL
#######  according to https://www.tunnelbroker.net/forums/index.php?topic=1994.0
#######  update it in case of any change
tunnel_update_url="https://${tunnel_user}:${tunnel_pass}@ipv4.tunnelbroker.net/nic/update?hostname=${tunnel_id1}"

####  external_if should point to the interface 
####      that has a public IPv4 address or the
####      used to access internet

external_if=ppp0
file_2_update="/etc/network/interfaces"

########    not used for now ############
#distro=
#OS=

echo $tunnel_user
echo $tunnel_pass
echo $tunnel_id
echo $tunnel_update_url

external_ip=$(ip -f inet addr show  $external_if | grep inet | awk '{print $2}')
