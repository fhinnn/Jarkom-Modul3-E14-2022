echo 'nameserver 192.168.122.1' >/etc/resolv.conf
apt update
apt install squid -y
mv /etc/squid/squid.conf /etc/squid/squid.conf.bak

echo 'acl AVAILABLE time MTWHF 00:00-07:59
acl AVAILABLE2 time MTWHF 17:01-23:59
acl AVAILABLE3 time AS 00:00-23:59
acl JAM_KERJA time MTWHF 08:00-17:00
acl ALLOWED_DOMAIN dstdomain .loid-work.com .franky-work.com
acl BLOCKED url_regex ^http://.*$
acl SYULIT url_regex ^https://.*$' >/etc/squid/acl.conf

echo 'include /etc/squid/acl.conf

http_port 5000
http_access allow AVAILABLE 
http_access allow AVAILABLE2
http_access allow AVAILABLE3
http_access allow JAM_KERJA ALLOWED_DOMAIN
http_access deny BLOCKED
visible_hostname Berlint' >/etc/squid/squid.conf

service squid restart
