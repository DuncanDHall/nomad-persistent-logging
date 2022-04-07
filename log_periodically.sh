#!/bin/bash
while true
do
    echo "my stdout message"
    1>&2 echo "my stderr message"
    sleep 15
done