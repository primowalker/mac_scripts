#!/usr/bin/env python
# Execute Linux Commands in Python

from subprocess import Popen, PIPE, STDOUT

def run(cmd):
    p = Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
    return p.stdout.read()

