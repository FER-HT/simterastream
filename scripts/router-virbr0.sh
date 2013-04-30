#!/bin/sh -e

. ./addr-conf.sh

ROUTER_IF=virbr0

echo Local IPv4 address: $LOCAL_IPV4
echo Local STF address: $LOCAL_STF
echo 48-bit prefix: $PREFIX_48
echo 64-bit prefix: $PREFIX_64
echo Router $ROUTER_IF address: $ADDR_ROUTER

ip -6 addr add $ADDR_ROUTER/64 dev $ROUTER_IF


