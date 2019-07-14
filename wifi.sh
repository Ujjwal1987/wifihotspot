sleep 30
connected_network="$(iwconfig wlan0| grep ESSID | cut -c 31-100)"
stored_network="$(cat /etc/wpa_supplicant/wpa_supplicant.conf | grep ssid | cut -c 8-100)"
echo $connected_network
echo $stored_network
if [ $connected_network == $stored_network ]; then
	echo "i am if"
else 
	wifistatus="$(cat wifistatus.txt)"
	if [ "$wifistatus" == "0" ]; then
		sudo python Wifiserver.py &
	else
	echo "i am else"
	sudo cp /etc/dhcpcd.conf.back /etc/dhcpcd.conf
    	sudo cp /etc/dnsmasq.conf.back /etc/dnsmasq.conf
    	sudo systemctl restart dhcpcd
	sudo systemctl reload dnsmasq
	echo "0" > wifistatus.txt
	sudo reboot
	fi
fi
