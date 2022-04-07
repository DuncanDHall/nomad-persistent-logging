#!/bin/bash
python3 -m http.server 5000 &

while true
do
    echo "my stdout message"
    1>&2 echo "my stderr message"
    sleep 5
done