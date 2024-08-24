FROM nextcloud:fpm-alpine

RUN apk add --no-cache clamav-daemon freshclam clamav-libunrar supervisor \
  && mkdir /var/log/supervisord /var/run/supervisord \
  && freshclam \
  && mkdir /run/clamav

COPY etc /etc/

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
