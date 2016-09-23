#!/bin/bash

# start ssh service
# service ssh start

# start nginx service
/usr/bin/nginx

/usr/sbin/sshd -D

#while true; do sleep 1000; done
