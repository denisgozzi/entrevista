#!/bin/sh
cat /var/log/nginx/access.log | cut -d '"' -f3 | cut -d ' ' -f2 | uniq -c | sort -rn
