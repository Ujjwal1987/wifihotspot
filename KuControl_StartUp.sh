echo 'apt-get update'
apt-get update
echo 'apt-get -y install mosquitto mosquitto-clients'
apt-get -y install mosquitto mosquitto-clients
echo 'mosquitto_passwd -b /etc/mosquitto/passwd openhabian Ujjwal1234$'
mosquitto_passwd -b /etc/mosquitto/passwd openhabian Ujjwal1234$
echo 'systemctl enable mosquitto.service'
systemctl enable mosquitto.service
echo 'systemctl restart mosquitto.service'
systemctl restart mosquitto.service
echo 'apt-get -y install dnsmasq hostapd'
apt-get -y install dnsmasq hostapd
echo 'git clone https://github.com/Ujjwal1987/wifihotspot.git'
git clone https://github.com/Ujjwal1987/wifihotspot.git
echo 'git clone https://github.com/Ujjwal1987/Autodiscovery.git'
git clone https://github.com/Ujjwal1987/Autodiscovery.git

echo 'cp -r /home/openhabian/wifihotspot/autodiscover /etc/systemd/'
cp -r /home/openhabian/wifihotspot/autodiscover /etc/systemd/
echo 'cp -r /home/openhabian/wifihotspot/autodiscover.service /etc/systemd/system/'
cp -r /home/openhabian/wifihotspot/autodiscover.service /etc/systemd/system/ 
echo 'cp /home/openhabian/wifihotspot/addons.cfg /etc/openhab2/services/'
cp /home/openhabian/wifihotspot/addons.cfg /etc/openhab2/services/
echo 'cp /home/openhabian/wifihotspot/kucontrol.service /etc/avahi/services/'
cp /home/openhabian/wifihotspot/kucontrol.service /etc/avahi/services/
echo 'cp /home/openhabian/wifihotspot/dhcpcd.conf.back /etc/'
cp /home/openhabian/wifihotspot/dhcpcd.conf.back /etc/
echo 'cp /home/openhabian/wifihotspot/dhcpcd.conf.back1 /etc/'
cp /home/openhabian/wifihotspot/dhcpcd.conf.back1 /etc/
echo 'cp /home/openhabian/wifihotspot/dnsmasq.conf.back /etc/'
cp /home/openhabian/wifihotspot/dnsmasq.conf.back /etc/
echo 'cp /home/openhabian/wifihotspot/dnsmasq.conf.back1 /etc/'
cp /home/openhabian/wifihotspot/dnsmasq.conf.back1 /etc/
echo 'cp /home/openhabian/wifihotspot/hostapd.conf /etc/hostapd/hostapd.conf'
cp /home/openhabian/wifihotspot/hostapd.conf /etc/hostapd/hostapd.conf
echo 'cp /home/openhabian/wifihotspot/wifihotspot.service /etc/systemd/system/'
cp /home/openhabian/wifihotspot/wifihotspot.service /etc/systemd/system/
echo 'cp /home/openhabian/wifihotspot/wifi.sh /home/openhabian/'
cp /home/openhabian/wifihotspot/wifi.sh /home/openhabian/
echo 'cp /home/openhabian/wifihotspot/Wifiserver.py /home/openhabian'
cp /home/openhabian/wifihotspot/Wifiserver.py /home/openhabian
echo 'cp /home/openhabian/wifihotspot/index.html /home/openhabian'
cp /home/openhabian/wifihotspot/index.html /home/openhabian
echo 'cp /home/openhabian/wifihotspot/hostapd /etc/default/hostapd'
cp /home/openhabian/wifihotspot/hostapd /etc/default/hostapd

chmod 755 /etc/systemd/autodiscover/*
echo 'systemctl enable autodiscover.service'
systemctl enable autodiscover.service
echo 'systemctl start autodiscover.service'
systemctl start autodiscover.service

echo 'systemctl enable wifihotspot.service'
systemctl enable wifihotspot.service 
echo 'systemctl start wifihotspot.service'
systemctl start wifihotspot.service

echo 'systemctl /home/openhabian unmask hostapd'
systemctl /home/openhabian unmask hostapd
echo 'systemctl enable hostapd'
systemctl enable hostapd
echo 'systemctl start hostapd'
systemctl start hostapd

echo 'pip install bottle'
pip install bottle
echo 'sudo reboot'
sleep 10
sudo reboot
