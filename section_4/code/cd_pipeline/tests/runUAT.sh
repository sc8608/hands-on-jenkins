#!/bin/bash

# set variables
hostname='192.168.101.123'
port=$1

# wait for the app to start
sleep 5 

# ping the app
status_code=$(curl -s -o /dev/null -w "%{http_code}" ${hostname}:${port})
echo return code is $status_code

if [ $status_code == 200 ];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
    exit 1
fi
