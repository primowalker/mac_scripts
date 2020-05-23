!/usr/bin/env python
# Linux date formats vs Python datimeformats (MICROSECONDS PROBLEMS!!!)

$ date +"%F %T.%6N"
'2016-10-02 16:00:53.403152'

>>> from datetime import datetime

>>> datetime.strptime('2016-10-02 16:00:53.403152', '%Y-%m-%d %H:%M:%S.%f')
datetime.datetime(2016, 10, 2, 16, 0, 53, 403152)


