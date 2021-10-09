
FROM martinhelmich/typo3

LABEL maintainer="Jannick Bruhns <docker@nyze.one>"

ENV EMAIL no@no.com
ENV DOMAIN www.example.com



# Install TYPO3
RUN apt-get update && \
        apt install certbot python3-certbot-apache -y
COPY createSSL.sh /usr/local/bin
ENTRYPOINT [ "createSSL.sh" ]
WORKDIR /var/www/html
EXPOSE 443
EXPOSE 80
CMD ["apache2-foreground"]