yum install epel-release -y
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel git -y
mv configure ~/config_ss_temp
cd ~
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev/
git submodule update --init
./autogen.sh && ./configure && make
make install
cd /etc
mkdir shadowsocks
cd shadowsocks
mv ~/config_ss_temp ./configure
firewall-cmd --zone=public --add-port=8000/tcp --permanent
firewall-cmd --reload
read -p "Do you want to load ss now? (y/n): " flag
if [ "$flag" = "y" -o "$flag" = "Y" ]
then
ss-server -c /etc/shadowsocks/configure
echo "Start ss!"
elif [ "$flag" = "n" -o "$flag" = "N" ]
then
echo "success !"
else 
echo -e "\nWrong input!\nDo not start ss!"
fi
