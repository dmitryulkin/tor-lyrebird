#!/bin/bash

cookie=$(sudo hexdump -e '32/1 "%02x""\n"' ./tor/data/control_auth_cookie)

cat <<EOF | nc localhost 9351
authenticate $cookie
signal newnym
quit
EOF
