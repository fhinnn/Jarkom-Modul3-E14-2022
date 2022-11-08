apt update
apt install isc-dhcp-relay -y
service isc-dhcp-relay start
echo 'SERVERS="192.199.2.4"
INTERFACES="eth1 eth2 eth3"
OPTIONS=' >/etc/default/isc-dhcp-relay
echo 'net.ipv4.ip_forward=1' >/etc/sysctl.conf
service isc-dhcp-relay start
