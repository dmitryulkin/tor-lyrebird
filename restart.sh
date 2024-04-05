#!/bin/bash
# DEBUG Reload torrc without container restart
# works only when start.sh configured with wait -f
# docker exec tor-lyrebird /srv/restart.sh
pkill tor
sleep 1
/usr/bin/tor -f /etc/tor/torrc &
