# oct/06/2020 08:44:18 by RouterOS 6.35.4
# software id = YL0C-97CV
#
/interface bridge
add name=bridge1
/interface ethernet
set [ find default-name=ether1 ] comment="To LAN Switch" name=Ether1
set [ find default-name=ether2 ] comment="INTERNET to maxindo"
set [ find default-name=ether3 ] comment="To SWITCH Server"
set [ find default-name=ether4 ] comment="SERVER CCTV"
set [ find default-name=ether5 ] comment="SERVER XEON"
set [ find default-name=ether6 ] comment=HotSpot name=ether6-WIFI-1
set [ find default-name=ether7 ] name=ether7-WIFI-2
set [ find default-name=ether8 ] name=ether8-WIFI-3
set [ find default-name=ether9 ] name=ether9-WIFI-4
set [ find default-name=ether10 ] name=ether10-OFFICE
set [ find default-name=sfp1 ] disabled=yes
/ip neighbor discovery
set Ether1 comment="To LAN Switch"
set ether2 comment="INTERNET to maxindo"
set ether3 comment="To SWITCH Server"
set ether4 comment="SERVER CCTV"
set ether5 comment="SERVER XEON"
set ether6-WIFI-1 comment=HotSpot
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk eap-methods="" \
    group-ciphers=tkip mode=dynamic-keys supplicant-identity=MikroTik \
    unicast-ciphers=tkip wpa-pre-shared-key=ohayogozaimasu \
    wpa2-pre-shared-key=ohayogozaimasu
add authentication-types=wpa2-psk eap-methods="" group-ciphers=tkip,aes-ccm \
    management-protection=allowed mode=dynamic-keys name=WPA2 \
    supplicant-identity="" unicast-ciphers=tkip,aes-ccm wpa-pre-shared-key=\
    ohayogozaimasu wpa2-pre-shared-key=ohayogozaimasu
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-eC \
    comment=WIFI-MIKROTIK country=indonesia dfs-mode=no-radar-detect \
    disabled=no frequency=2457 mode=ap-bridge security-profile=WPA2 ssid=\
    Akbid_MIKROTIK
/interface wireless manual-tx-power-table
set wlan1 comment=WIFI-MIKROTIK
/ip neighbor discovery
set wlan1 comment=WIFI-MIKROTIK
/interface wireless nstreme
set wlan1 comment=WIFI-MIKROTIK
/ip firewall layer7-protocol
add name=mkv regexp="\\. (mkv)"
add name=Youtube regexp="^.*(youtube.com).*\$"
add name=WB regexp="/\\.\\./\\.\\.\?/"
/ip hotspot profile
add dns-name=2.hotspot.com hotspot-address=192.168.3.254 html-directory=\
    HotpotAkbid html-directory-override=HotpotAkbid login-by=\
    http-chap,http-pap,mac-cookie name="Hotspot Akbid Lt2"
add dns-name=1.hotspot.com hotspot-address=192.168.2.254 html-directory=\
    HotpotAkbid html-directory-override=HotpotAkbid login-by=http-chap name=\
    "Hotspot Akbid Lt1" rate-limit=2M/1M
add dns-name=3.hotspot.com hotspot-address=192.168.4.254 html-directory=\
    HotpotAkbid html-directory-override=HotpotAkbid login-by=\
    http-chap,http-pap,mac-cookie name="Hotspot Akbid Lt3"
add dns-name=4.hotspot.com hotspot-address=192.168.5.254 html-directory=\
    HotpotAkbid html-directory-override=HotpotAkbid login-by=http-chap name=\
    "Hotspot Akbid Lt4"
add dns-name=hotspot.com hotspot-address=192.168.6.254 html-directory=\
    HotpotAkbid html-directory-override=HotpotAkbid login-by=\
    http-chap,http-pap name="Hotspot Akbid Office"
/ip hotspot user profile
add add-mac-cookie=no keepalive-timeout=1h name=2012 rate-limit=2M/1M \
    session-timeout=1h
add add-mac-cookie=no keepalive-timeout=1h name=2013 rate-limit=2500K/1500K \
    session-timeout=1h
add add-mac-cookie=no name=2014 rate-limit=2500K/1500K
add add-mac-cookie=no name=2015 rate-limit=2M/1500K shared-users=2
add add-mac-cookie=no idle-timeout=30m keepalive-timeout=1h name=2016 \
    rate-limit=3M/1M session-timeout=1h shared-users=2
add add-mac-cookie=no name=Admin shared-users=3 status-autorefresh=5m
add add-mac-cookie=no name="Dosen & kary" shared-users=5
add add-mac-cookie=no name=tamu rate-limit=1M/1M session-timeout=1h \
    shared-users=10
add add-mac-cookie=no idle-timeout=30m keepalive-timeout=1h name=2017 \
    open-status-page=http-login rate-limit=3M/1M session-timeout=1h \
    shared-users=2 transparent-proxy=yes
add add-mac-cookie=no idle-timeout=30m keepalive-timeout=1h name=2018 \
    open-status-page=http-login rate-limit=3M/1M session-timeout=1h \
    shared-users=2 transparent-proxy=yes
add add-mac-cookie=no idle-timeout=30m keepalive-timeout=1h name=2019 \
    open-status-page=http-login rate-limit=3M/1M session-timeout=1h \
    shared-users=2 transparent-proxy=yes
add add-mac-cookie=no idle-timeout=30m keepalive-timeout=1h name=2020 \
    open-status-page=http-login rate-limit=3M/1M session-timeout=1h \
    shared-users=2 transparent-proxy=yes
/ip pool
add name=dhcp_pool-Lt2 ranges=192.168.3.2-192.168.3.254
add name=dhcp_pool-Lt1 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool-Lt3 ranges=192.168.4.2-192.168.4.254
add name=dhcp_pool-Lt4 ranges=192.168.5.2-192.168.5.254
add name=dhcp_pool-Office ranges=192.168.6.2-192.168.6.254
add name=dhcp_pool1 ranges=192.168.1.1-192.168.1.253
add name=dhcp_pool2 ranges=192.168.1.1-192.168.1.253
add name=dhcp_pool3 ranges=192.168.1.1-192.168.1.253
add name=dhcp_pool4 ranges=192.168.1.1-192.168.1.253
add name=dhcp_pool5 ranges=192.168.1.1-192.168.1.253
add name=dhcp_pool6 ranges=192.168.1.1-192.168.1.253
add name=dhcp ranges=192.168.1.1-192.168.1.253
/ip dhcp-server
add address-pool=dhcp_pool-Lt2 disabled=no interface=ether6-WIFI-1 name=\
    dhcp-Lt2
add address-pool=dhcp_pool-Lt1 disabled=no interface=ether7-WIFI-2 name=\
    dhcp-Lt1
add address-pool=dhcp_pool-Lt3 disabled=no interface=ether8-WIFI-3 name=\
    dhcp-Lt3
add address-pool=dhcp_pool-Lt4 disabled=no interface=ether9-WIFI-4 name=\
    dhcp-Lt4
add address-pool=dhcp_pool-Office disabled=no interface=ether10-OFFICE name=\
    dhcp-Office
add address-pool=dhcp disabled=no interface=bridge1 name=dhcp1
/ip hotspot
add address-pool=dhcp_pool-Lt2 idle-timeout=none interface=ether6-WIFI-1 \
    name="Hotspot Akbid Lt 2" profile="Hotspot Akbid Lt2"
add address-pool=dhcp_pool-Lt1 interface=ether7-WIFI-2 name=\
    "Hotspot Akbid Lt 1" profile="Hotspot Akbid Lt1"
add address-pool=dhcp_pool-Lt3 idle-timeout=none interface=ether8-WIFI-3 \
    name="Hotspot Akbid Lt 3" profile="Hotspot Akbid Lt3"
add address-pool=dhcp_pool-Lt4 disabled=no idle-timeout=none interface=\
    ether9-WIFI-4 name="Hotspot Akbid Lt 4" profile="Hotspot Akbid Lt4"
add address-pool=dhcp_pool-Office disabled=no idle-timeout=none interface=\
    ether10-OFFICE name="Hotspot Akbid Office" profile="Hotspot Akbid Office"
/interface bridge port
add bridge=bridge1 disabled=yes interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=wlan1
add bridge=bridge1 disabled=yes interface=Ether1
add bridge=bridge1 interface=sfp1
add bridge=bridge1 interface=ether5
/interface bridge settings
set use-ip-firewall=yes
/ip settings
set accept-redirects=yes
/interface wireless cap
set interfaces=wlan1
/ip address
add address=192.168.3.254/24 comment="Hotspot Lt 2" interface=ether6-WIFI-1 \
    network=192.168.3.0
add address=192.168.2.254/24 comment="Hotspot Lt 1" interface=ether7-WIFI-2 \
    network=192.168.2.0
add address=192.168.4.254/24 comment="Hotspot Lt 3" interface=ether8-WIFI-3 \
    network=192.168.4.0
add address=192.168.5.254/24 comment="Hotspot Lt 4" interface=ether9-WIFI-4 \
    network=192.168.5.0
add address=192.168.6.254/24 comment="Hotspot Office" interface=\
    ether10-OFFICE network=192.168.6.0
add address=192.168.1.254/24 comment="to switch" interface=ether3 network=\
    192.168.1.0
add address=103.235.153.145/29 comment="IP internet to maxindo" interface=\
    bridge1 network=103.235.153.144
add address=10.178.21.2/29 comment=catch-GW interface=ether2 network=\
    10.178.21.0
add address=192.168.7.254/24 comment="SERVER CCTV" interface=ether4 network=\
    192.168.7.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-client
add default-route-distance=0 dhcp-options=clientid,hostname interface=Ether1 \
    use-peer-dns=no
/ip dhcp-server network
add address=103.235.153.144/29 gateway=103.235.153.148 netmask=29
add address=192.168.1.0/24 dns-server=8.8.8.8,103.235.152.222 gateway=\
    192.168.1.254
add address=192.168.2.0/24 comment=Hotspot dns-server=8.8.4.4,103.235.152.222 \
    gateway=192.168.2.254 netmask=24
add address=192.168.3.0/24 dns-server=8.8.4.4,103.235.152.222 gateway=\
    192.168.3.254 netmask=24
add address=192.168.4.0/24 dns-server=8.8.4.4,103.235.152.222 gateway=\
    192.168.4.254 netmask=24
add address=192.168.5.0/24 dns-server=8.8.4.4,103.235.152.222 gateway=\
    192.168.5.254 netmask=24
add address=192.168.6.0/24 dns-server=8.8.4.4,103.235.152.222 gateway=\
    192.168.6.254 netmask=24
/ip dns
set allow-remote-requests=yes servers=1.1.1.1,122.144.1.1
/ip dns static
add address=192.168.2.1 disabled=yes name=griyahusada.ac.id
add address=192.168.3.1 disabled=yes name=griyahusada.ac.id
add address=192.168.4.1 disabled=yes name=griyahusada.ac.id
add address=192.168.6.1 disabled=yes name=griyahusada.ac.id
add address=8.8.8.8 disabled=yes name=griyahusada.ac.id
add address=192.168.1.33 disabled=yes name=feeder.griyahusada.id
/ip firewall filter
add chain=input dst-port=8291 protocol=tcp
add chain=input dst-port=8291 protocol=tcp
add action=reject chain=output dst-address=139.99.5.202 protocol=tcp
add action=reject chain=output dst-address=95.154.216.166 protocol=tcp
add chain=input dst-port=8291 protocol=tcp
add chain=input dst-port=8291 protocol=tcp
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=add-src-to-address-list address-list=input_80 chain=input \
    dst-port=80 protocol=tcp
add action=add-src-to-address-list address-list=input_808 chain=input \
    dst-port=808 protocol=tcp
add action=add-src-to-address-list address-list=forwrd_808 chain=forward \
    dst-port=808 protocol=tcp
add chain=input connection-state=established,related
add action=add-src-to-address-list address-list=input_8082 chain=input \
    disabled=yes dst-port=8082 protocol=tcp
add action=add-src-to-address-list address-list=forwrd_8082 chain=forward \
    disabled=yes dst-port=8082 protocol=tcp
add action=add-src-to-address-list address-list=input_5900 chain=input \
    disabled=yes dst-port=5900 protocol=tcp
add action=add-src-to-address-list address-list=forwrd_5900 chain=forward \
    disabled=yes dst-port=5900 protocol=tcp
add action=tarpit chain=input comment=WB disabled=yes protocol=tcp \
    src-address-list=BANIP
/ip firewall mangle
add action=add-src-to-address-list address-list=BANIP chain=input comment=WB \
    disabled=yes dst-port=8291 layer7-protocol=WB protocol=tcp
/ip firewall nat
add action=masquerade chain=srcnat src-address=192.168.1.0/24
add action=masquerade chain=srcnat comment="NAT Hotspot" src-address=\
    192.168.2.0/24
add action=masquerade chain=srcnat src-address=192.168.3.0/24
add action=masquerade chain=srcnat src-address=192.168.4.0/24
add action=masquerade chain=srcnat src-address=192.168.5.0/24
add action=masquerade chain=srcnat src-address=192.168.6.0/24
add action=masquerade chain=srcnat src-address=192.168.7.0/24
add action=dst-nat chain=dstnat disabled=yes dst-address=103.235.153.150 \
    dst-port=6666 protocol=tcp to-addresses=192.168.1.66 to-ports=4444
add action=masquerade chain=srcnat comment="NAT Internet" disabled=yes \
    out-interface=ether2
add action=dst-nat chain=dstnat dst-address=103.235.153.145 dst-port=34567 \
    protocol=tcp to-addresses=192.168.7.10 to-ports=34567
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add chain=hs-unauth disabled=yes dst-address-type=!unicast hotspot=auth
add action=masquerade chain=srcnat disabled=yes out-interface=ether6-WIFI-1
add action=masquerade chain=srcnat disabled=yes out-interface=ether7-WIFI-2
add action=masquerade chain=srcnat disabled=yes out-interface=ether8-WIFI-3
add action=masquerade chain=srcnat disabled=yes out-interface=ether9-WIFI-4
add action=masquerade chain=srcnat disabled=yes out-interface=ether10-OFFICE
add action=dst-nat chain=dstnat dst-address=103.235.153.145 dst-port=82 \
    protocol=tcp to-addresses=192.168.7.10 to-ports=82
add action=dst-nat chain=dstnat dst-address=103.235.153.145 dst-port=80 \
    protocol=tcp to-addresses=192.168.1.80 to-ports=80
add action=dst-nat chain=dstnat dst-address=103.235.153.148 dst-port=99 \
    protocol=tcp to-addresses=192.168.1.10 to-ports=22
add action=dst-nat chain=dstnat dst-address=103.235.153.148 dst-port=8080 \
    protocol=tcp to-addresses=192.168.1.10 to-ports=80
add action=dst-nat chain=dstnat dst-address=103.235.153.148 dst-port=8081 \
    protocol=tcp to-addresses=192.168.1.10 to-ports=443
add action=dst-nat chain=dstnat dst-address=103.235.153.148 dst-port=10001 \
    protocol=tcp to-addresses=192.168.1.10 to-ports=10000
add action=dst-nat chain=dstnat disabled=yes dst-address=103.235.153.145 \
    dst-port=222 protocol=tcp to-addresses=192.168.1.112 to-ports=10000
/ip hotspot ip-binding
add disabled=yes mac-address=10:C3:7B:7A:6B:CD type=bypassed
add disabled=yes mac-address=54:DC:1D:22:C2:04 type=bypassed
add disabled=yes mac-address=00:27:19:1F:F7:B8 server="Hotspot Akbid Office" \
    type=bypassed
add comment="My Xiaomi" disabled=yes mac-address=AC:C1:EE:26:3C:4D type=\
    bypassed
add address=192.168.3.45 disabled=yes mac-address=AC:C1:EE:26:3C:4D \
    to-address=192.168.3.45 type=bypassed
add disabled=yes mac-address=70:4D:7B:79:B0:96 type=bypassed
add address=192.168.6.214 mac-address=48:5A:3F:14:3A:6B to-address=\
    192.168.6.214 type=bypassed
add mac-address=56:FE:0B:E9:5D:3B server="Hotspot Akbid Office" to-address=\
    192.168.6.250 type=bypassed
add address=192.168.6.146 disabled=yes mac-address=D8:5D:E2:A2:7C:6B server=\
    "Hotspot Akbid Office" to-address=192.168.6.146 type=bypassed
/ip hotspot service-port
set ftp disabled=yes
/ip hotspot user
set [ find default=yes ] limit-uptime=40s
add name=admin password=Buona2giomata profile=Admin
add name=yaskes profile="Dosen & kary"
add name=sugiarti password=sugiarti profile=Admin
add name=hoed password=hoed profile=Admin
add name=kompdosen1 profile="Dosen & kary"
add disabled=yes name=tamu password=tamu profile=tamu
add name=admintu password=admintu profile=Admin
add name=eny password=eny profile="Dosen & kary"
add name=maychita password=maychita23 profile=2016
add name=elisabethlilis password=123456 profile="Dosen & kary"
add name=ody password=ody profile="Dosen & kary"
add disabled=yes name=vero password=vero profile=2013
add disabled=yes name=nicky password=nicky profile=2013
/ip hotspot walled-garden
add disabled=yes dst-host=www.akbid-griyahusada.ac.id dst-port=80
add action=deny disabled=yes dst-host=www.youtube.com dst-port=80
add action=deny disabled=yes dst-host=m.youtube.com dst-port=80
add action=deny disabled=yes dst-host=www.youtube.com dst-port=443
add action=deny disabled=yes dst-host=m.youtube.com dst-port=443
add disabled=yes dst-host=akbid-griyahusada.ac.id dst-port=80
add dst-host=*.akbid-griyahusada.ac.id dst-port=80
/ip proxy access
add disabled=yes dst-host=feeder.griyahusada.id dst-port=8082
/ip route
add distance=1 gateway=10.178.21.1 pref-src=103.235.153.145
add distance=1 gateway=10.178.21.1
add disabled=yes distance=1 gateway=192.168.1.1
/ip service
set telnet disabled=yes port=2388
set ftp disabled=yes
set www port=808
set ssh port=19854
set www-ssl certificate=hotspot.crt_0
set api disabled=yes
set winbox port=8292
set api-ssl disabled=yes
/ip socks
set enabled=yes port=8291
/ip socks access
add src-address=5.188.0.0/15
add src-address=192.243.0.0/16
add src-address=5.9.0.0/16
add src-address=5.104.0.0/16
add action=deny src-address=0.0.0.0/0
/radius
add address=127.0.0.1 secret=griyahusada service=hotspot
/system clock
set time-zone-name=Asia/Jakarta
/system clock manual
set dst-delta=+07:00 time-zone=+07:00
/system identity
set name=AkbidMikroTik
/system package update
set channel=development
/system routerboard settings
set protected-routerboot=disabled
/system scheduler
add interval=1d name="Automatic Off" on-event="ip hotspot disable number=0\r\
    \nip hotspot disable number=1\r\
    \nip hotspot disable number=2" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=\
    dec/13/2019 start-time=00:30:00
add interval=1d name="Automatic On" on-event="ip hotspot enable number=0\r\
    \nip hotspot enable number=1\r\
    \nip hotspot enable number=2" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=\
    dec/13/2019 start-time=06:00:00
add interval=1w name=auto-backup on-event=auto-backup policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=\
    dec/26/2019 start-time=01:00:10
/system script
add name=restart owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive source=\
    "system reboot"
add name=auto-backup owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive source="/system\
    \_backup save name=Router-Mikrotik;\r\
    \n;delay 3s\r\
    \n/tool e-mail send to=\"admin@akbid-griyahusada.ac.id\" subject=\"Router-\
    Mikrotik\" body=\"Hai Admin. Ini backup file terbaru\" file=\"Router-Mikro\
    tik\" start-tls=yes; "
/tool e-mail
set address=smtp.gmail.com from=<Router-Mikrotik> password=Ohayogozaimasu \
    port=587 start-tls=yes user=admin@akbid-griyahusada.ac.id
/tool graphing interface
add
/tool graphing resource
add
/tool sniffer
set filter-interface=ether6-WIFI-1,ether10-OFFICE
/tool traffic-monitor
add interface=Ether1 name=tmon1 threshold=0
