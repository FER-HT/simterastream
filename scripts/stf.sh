#!/bin/sh -e

. ./addr-conf.sh

echo Local IPv4 address: $LOCAL_IPV4
echo Local STF address: $LOCAL_STF

ip tunnel add tun6to4 mode sit ttl 64 remote any local $LOCAL_IPV4
ip link set dev tun6to4 up 
ip -6 addr add $LOCAL_STF/16 dev tun6to4 
ip -6 route add 2000::/3 via ::192.88.99.1 dev tun6to4 metric 1

