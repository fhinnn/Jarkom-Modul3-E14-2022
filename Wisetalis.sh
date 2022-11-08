apt update
apt install isc-dhcp-server -y
echo 'INTERFACES="eth0"' >/etc/default/isc-dhcp-server
echo 'subnet 192.199.1.0 netmask 255.255.255.0 {
    range 192.199.1.50 192.199.1.88;
    range 192.199.1.120 192.199.1.155;
    option routers 192.199.1.1;
    option broadcast-address 192.199.1.255;
    option domain-name-servers 192.199.2.2;
    default-lease-time 300;
    max-lease-time 6900;
}
subnet 192.199.2.0 netmask 255.255.255.0 {
}
subnet 192.199.3.0 netmask 255.255.255.0 {
    range 192.199.3.10 192.199.3.30;
    range 192.199.3.60 192.199.3.85;
    option routers 192.199.3.1;
    option broadcast-address 192.199.3.255;
    option domain-name-servers 192.199.2.2;
    default-lease-time 600;
    max-lease-time 6900;
}
host Eden {
    hardware ethernet 22:80:5a:6c:27:4c;
    fixed-address 192.199.3.13;
}' >/etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
