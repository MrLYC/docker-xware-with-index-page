#!/bin/bash

function cleaner() {
    while true; do
        sleep 60
        find /site/download/ -mmin +${FILE_EXPIRES} -type f -exec rm -f {} \;
    done
}

service nginx start
cleaner &
./monitor.sh
