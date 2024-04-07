#!/bin/bash

# & - indicates background job
# $! - fetch last backgroundtask PID
# $? - fetch exit code of last finished task
# wait $! - wait for task

# Start Tor
/usr/bin/tor -f /etc/tor/torrc &

# DEBUG start nothing
#tail -f /dev/null &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
