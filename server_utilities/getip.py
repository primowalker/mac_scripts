#!/usr/bin/env python
# Get IP

#get the mac address
import uuid
def get_mac_address(): 
    mac=uuid.UUID(int = uuid.getnode()).hex[-12:] 
    return ":".join([mac[e:e+2] for e in range(0,11,2)])

#get the ip address
import socket
def get_inet_ipaddress():
  myname = socket.getfqdn(socket.gethostname())
  myaddr = socket.gethostbyname(myname)
  #the name of computer
  print myname
  #the ineter ip of the computer
  print myaddr

import socket
import fcntl
import struct
  
def get_ip_address(ifname):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    return socket.inet_ntoa(fcntl.ioctl(
        s.fileno(),
        0x8915,  # SIOCGIFADDR
        struct.pack('256s', ifname[:15])
    )[20:24])

#>>> get_ip_address('lo')
#'127.0.0.1'
  
#>>> get_ip_address('eth0')
#'38.113.228.130'

