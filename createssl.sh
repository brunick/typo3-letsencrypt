#!/bin/bash
FILE=/root/ssl
if  test -f "$FILE"; then
    echo "startup"
else 
    if [ ${TEST} == "true" ]
    then
        certbot --staging --server https://acme-staging-v02.api.letsencrypt.org/directory --apache --email ${EMAIL} --domains ${DOMAIN}  --agree-tos --redirect
    else
        certbot --apache -n --agree-tos --email ${EMAIL} --domains ${DOMAIN}  --redirect 
        touch $FILE
    fi
fi 
/etc/init.d/apache2 stop
exec "$@"