import subprocess
from bottle import run, post, template, request, response, get, route, static_file
import shutil
import os
@route('/')
def index():
    return template('index')
@post('/wifi')
def setwifi():
    wifissid = request.forms.get('wifissid')
    password = request.forms.get('psw')

    shutil.copy('/etc/wpa_supplicant/wpa_supplicant.conf', '/etc/wpa_supplicant/wpa_supplicant1.conf')  

    f = open("/etc/wpa_supplicant/wpa_supplicant1.conf", "r")
    wpafile=f.readlines()
    print wpafile[0],wpafile[1],wpafile[2],wpafile[3],wpafile[4],wpafile[5],wpafile[6],wpafile[7],wpafile[8]
    ssidStart=wpafile[5].find("\"",1)
    ssidEnd=wpafile[5].find("\"",ssidStart+1)
    pswStart=wpafile[6].find("\"",1)
    pswEnd=wpafile[6].find("\"",pswStart+1)
    lenstr_ssid=len(wpafile[5])
    lenstr_psw=len(wpafile[6])
    f.close()


    oldstr_ssid=wpafile[5][ssidStart+1:ssidEnd]

    oldstr_psw= wpafile[6][pswStart+1:pswEnd]
    repstr_ssid=wpafile[5].replace(oldstr_ssid,wifissid,1)
    repstr_psw=wpafile[6].replace(oldstr_psw,password,1)


    f1 = open("/etc/wpa_supplicant/wpa_supplicant.conf", "w")
    f1.write(wpafile[0])
    f1.write(wpafile[1])
    f1.write(wpafile[2])
    f1.write(wpafile[3])
    f1.write(wpafile[4])
    f1.write(repstr_ssid)
    f1.write(repstr_psw)
    f1.write(wpafile[7])
    f1.write(wpafile[8])
    print wpafile[0],wpafile[1],wpafile[2],wpafile[3],wpafile[4],repstr_ssid,repstr_psw,wpafile[7],wpafile[8]
    
    f1.close()
    f2 = open("wifistatus.txt", "w")
    f2.write("1")
    f2.close
    shutil.copy('/etc/dnsmasq.conf.back1', '/etc/dnsmasq.conf')  
    shutil.copy('/etc/dhcpcd.conf.back1', '/etc/dhcpcd.conf')
    os.system('reboot')
    
    

run(host='192.168.4.1', port=8000, debug=True)
