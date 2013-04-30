#!/bin/sh -e

LOCAL_IF=eth0

LOCAL_IPV4=`ifconfig $LOCAL_IF | grep "inet addr" | grep -o -P '\d+.\d+.\d+.\d+' | head -n 1`
LOCAL_IPV4tr=`echo $LOCAL_IPV4 | tr "." " "`
LOCAL_STF=`printf "2002:%02x%02x:%02x%02x::1" $LOCAL_IPV4tr`

ADDR_IPV6=$LOCAL_STF

PREFIX_48=`echo $ADDR_IPV6 | grep -o -P '[0-9a-f]+:[0-9a-f]+:[0-9a-f]+'`
PREFIX_64=$PREFIX_48:1111

ADDR_ROUTER=$PREFIX_64::1

