IP=$(ifconfig | grep tun0 -A1 | grep inet | awk '{print $2}')

if [ -z "$IP" ]; then
	echo "VPN down"
else
	echo "$IP"
fi