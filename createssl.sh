#!/bin/bash
FILE=/root/ssl
if  test -f "$FILE"; then
    echo "done"
else 
    if [ "$TEST" == "true" ]
    then
        certbot --apache -n --agree-tos --email ${EMAIL} --domains ${DOMAIN}  --redirect --test-cert
    else
        certbot --apache -n --agree-tos --email ${EMAIL} --domains ${DOMAIN}  --redirect 
        touch $FILE
    fi
fi 

/etc/init.d/apache2 reload

set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- apache2-foreground "$@"
fi

exec "$@"