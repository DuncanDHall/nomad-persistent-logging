#!/bin/sh

# server
python3 -m http.server 5000 &

# ambient log chatter
sh log_periodically.sh
