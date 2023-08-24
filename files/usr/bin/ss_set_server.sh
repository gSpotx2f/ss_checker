#!/bin/sh

SERV_NAME="current"
SSLE="/etc/init.d/shadowsocks-libev"
[ -x $SSLE ] || { echo "Error! shadowsocks-libev does not exists." >&2; exit 1; }
output=`/usr/bin/ss_checker "$1"`
ret_code=$?
[ $ret_code -ne 0 ] && { echo "FAILED"; exit $ret_code; }
eval `echo "$output" | awk -F ": +" '{if(NR < 3) next; printf $1 "=\"" $2 "\";"}'`
[ -z "$server" -o -z "$server_port" -o -z "$method" -o -z "$password" ] && { echo "Error! Insufficient data." >&2; exit 1; }
uci batch << EOI
set shadowsocks-libev.$SERV_NAME="server"
set shadowsocks-libev.$SERV_NAME.server="$server"
set shadowsocks-libev.$SERV_NAME.server_port="$server_port"
set shadowsocks-libev.$SERV_NAME.method="$method"
set shadowsocks-libev.$SERV_NAME.password="$password"
set shadowsocks-libev.hi.local_address="0.0.0.0"
set shadowsocks-libev.hi.local_port="1100"
set shadowsocks-libev.hi.server="$SERV_NAME"
set shadowsocks-libev.hi.disabled="0"
set shadowsocks-libev.ss_rules.disabled="1"
EOI
uci commit shadowsocks-libev
$SSLE restart
$SSLE enabled || $SSLE enable
echo "OK"; exit 0
