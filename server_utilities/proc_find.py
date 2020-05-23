#!/usr/bin/env python
#  Get list of processes, their owners and RAM usage from a Linux system.

import os, sys
from os.path import join,getsize
import humanize
import pwd
import psutil
 
pids = [int(pid) for pid in os.listdir('/proc') if pid.isdigit()]
for elements in pids:
    p = psutil.Process(elements)
    proc_name  = p.name()
    proc_stat_file = os.stat("/proc/%d" % elements)
    uid = proc_stat_file.st_uid
    username = pwd.getpwuid(uid)[0]
    human_size = humanize.naturalsize(p.memory_info_ex()[0], gnu=True)
    #print  p.memory_info_ex()[0]
    #print username,"\t\t", elements,"\t\t", p.name(), "\t\t", human_size
    print username.ljust(20), elements, p.name(), human_size.rjust(20)


