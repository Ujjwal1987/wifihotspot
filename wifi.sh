while true
do
sleep 120
connected_network="$(iwconfig wlan0| grep ESSID | cut -c 31-100)"
stored_network="$(cat /etc/wpa_supplicant/wpa_supplicant.conf | grep ssid | cut -c 8-100)"
echo 'connected_network='  $connected_network
echo 'stored_network='  $stored_network
if [ $connected_network == $stored_network ]; then
	echo "i am if"
else 
	wifistatus="$(cat /home/openhabian/wifistatus.txt)"
        sleep 2
	if [ $wifistatus == "0" ]; then
         echo 'I am else..python'
	sudo python /home/openhabian/Wifiserver.py
	else
	echo "i am else..hotspot configuration"
	sudo cp /etc/dhcpcd.conf.back /etc/dhcpcd.conf
    	sudo cp /etc/dnsmasq.conf.back /etc/dnsmasq.conf
    	echo "0" > /home/openhabian/wifistatus.txt
        echo 'rebooting'
	sudo reboot
	fi
fi
done
