#!/bin/bash

#
# Date: 28/06/2021
# Author: AzagraMac
# Version: 1.3
# License: GPL
#

logo="$(tput setaf 2)
       .~~.   .~~.
      '. \ ' ' / .'$(tput setaf 1)
       .~ .~~~..~.    $(tput sgr0)                   _                          _ $(tput setaf 1)
      : .~.'~'.~. :   $(tput sgr0)   ___ ___ ___ ___| |_ ___ ___ ___ _ _    ___|_|$(tput setaf 1)
     ~ (   ) (   ) ~  $(tput sgr0)  |  _| .'|_ -| . | . | -_|  _|  _| | |  | . | |$(tput setaf 1)
    ( : '~'.~.'~' : ) $(tput sgr0)  |_| |__,|___|  _|___|___|_| |_| |_  |  |  _|_|$(tput setaf 1)
     ~ .~ (   ) ~. ~  $(tput sgr0)              |_|                 |___|  |_|    $(tput setaf 1)
      (  : '~' :  )
       '~ .~~~. ~'
           '~'
$(tput sgr0)			Uptime.............: `uptime -p`
			Memory.............: Free: `free -mh | grep Mem | awk '{print $4}'` / Total: `free -mh | grep Mem | awk '{print $2}'`
			CPU Temp...........: `vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*'`º
			IP Address.........: Local: `/sbin/ifconfig eth0 | /bin/grep "inet" | /usr/bin/cut -d ":" -f 2 | awk '{printf $2}'`, Public: `curl -s http://checkip.amazonaws.com | tail`

"

if [ `whoami` != "root" ]; then
	echo "$logo"
	echo "Run as root to update your motd."
else
	echo "$logo" > /etc/motd
	/etc/init.d/bootlogs
	echo "Updated MOTD. Log in to see the new logo."
fi
