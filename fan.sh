#!/bin/bash
# /etc/init.d/fan

### BEGIN INIT INFO

# Provides:fan
# Required-Start:$remote_fs $syslog
# Required-Stop:$remote_fs $syslog
# Default-Start:2 3 4 5
# Default-Stop:0 1 6
# Short-Description: fan
# Description: Fan controller auto start after boot
### END INIT INFO

case "$1" in
    start)
        echo "Starting Fan"
        python /home/pi/Scripts/fan.py &
        ;;
    stop)
        echo "Stopping Fan"
        #killall ledblink.py
        kill $(ps aux | grep -m 1 'python /home/pi/Scripts/fan.py' | awk '{ print $2 }')
        ;;
    *)
        echo "Usage: service fan start|stop"
        exit 1
        ;;
esac
exit 0