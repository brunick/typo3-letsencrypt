
FROM martinhelmich/typo3

LABEL maintainer="Jannick Bruhns <docker@nyze.one>"

ENV EMAIL no@no.com
ENV DOMAIN www.example.com

# Install TYPO3
RUN apt-get update && \
        apt install certbot python3-certbot-apache -y
COPY createssl.sh /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/createssl.sh" ]
WORKDIR /var/www/html
EXPOSE 443
EXPOSE 80
CMD ["apache2-foreground"]