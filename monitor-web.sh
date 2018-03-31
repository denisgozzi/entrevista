#!/bin/sh
 
PROCESSFILE='/usr/bin/node /app/index.js'
 
if [ `ps ax|grep -v grep|grep -ic $PROCESSFILE` -gt 0 ]
then
        echo "$PROCESSFILE is running, everything is fine"
else
        forever start /app/index.js
fi
 
exit
