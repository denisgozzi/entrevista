#!/bin/sh
 
PROCESSFILE='/usr/sbin/nginx'
 
if [ `ps ax|grep -v grep|grep -ic $PROCESSFILE` -gt 0 ]
then
        echo "$PROCESSFILE is running, everything is fine"
else
        echo "$PROCESSFILE is not running on `hostname -s`!" | mail -s "$PROCESSFILE down!" matthiash@mydomain.com
fi
 
exit
