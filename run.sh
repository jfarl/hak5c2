#!/bin/bash


# ugly but readable lel
# if variable is not empty
if ! [ -z "$certFile" ]; then
    certFile="-certfile $certFile"
fi

if ! [ -z "$db" ]; then
    db="-db $db"
fi

if ! [ -z "$https" ]; then
    https="-https"
fi

if ! [ -z "$keyFile" ]; then
    keyFile="-keyFile $keyFile"
fi

if ! [ -z "$listenip" ]; then
    listenip="-listenip $listenip"
fi

if ! [ -z "$listenport" ]; then
    listenport="-listenport $listenport"
fi

if ! [ -z "$reverseProxy" ]; then
    reverseProxy="-reverseProxy"
fi

if ! [ -z "$reverseProxyPort" ]; then
    reverseProxyPort="-reverseProxyPort $reverseProxyPort"
fi

if ! [ -z "$sshport" ]; then
    sshport="-sshport $sshport"
fi

if ! [ -z "$hostname" ]; then
    hostname="-hostname $hostname"
else
	hostname="-hostname $(hostname -f)"
fi


echo "using following settings:" $hostname $certFile $db $https $keyFile $listenip $listenport $reverseProxy $reverseProxyPort $sshport

/app/latest_amd64_linux $hostname $certFile $db $https $keyFile $listenip $listenport $reverseProxy $reverseProxyPort $sshport