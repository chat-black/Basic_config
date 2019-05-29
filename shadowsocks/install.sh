if test type pip
then
    echo Have pip
else
    yum install epel-release
    yum install pip
fi
pip install shadowsocks
if [ -f /etc/shadowsocks.json || touch /etc/shadowsocks.json ]
then
    echo '{ "server":"my_server_ip",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"mypassword",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}' > /etc/shadowsocks.json
fi

cd 
if [ -d ~/bin || mkdir bin ]
then
    cd bin
    touch shadowsocks
    echo '#!/bin/bash
if (($#==0))
then
        echo Give me a command!
elif [[ "$1" = "start" ]]
then
        ssserver -c /etc/shadowsocks.json -d start
        #ssserver -p 443 -k password -m rc4-md5 --user nobody -d start
elif [[ "$1" = "stop" ]]
then
        ssserver -c /etc/shadowsocks.json -d stop
        #ssserver -d stop
fi
' > shadowsocks
fi
