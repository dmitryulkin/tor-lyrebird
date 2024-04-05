#!/bin/bash

## & - indicates background job
## $! - fetch last backgroundtask PID
## $? - fetch exit code of last finished task
## wait $! - wait for task

# Start Tor
/usr/bin/tor -f /etc/tor/torrc &

# DEBUG start nothing
#tail -f /dev/null &

# Wait for any process to exit
wait -n

# DEBUG Wait for any process to finish
# Ignores process kill gives to restart processes
# without container restart in dev time
# docker exec tor-lyrebird pkill tor
# docker exec tor-lyrebird /usr/bin/tor -f /etc/tor/torrc &
#wait -f

# Exit with status of process that exited first
exit $?
