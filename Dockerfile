FROM ubuntu:16.04
MAINTAINER Dave Burke "dburke84@gmail.com"

RUN apt-get --quiet update && apt-get --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages dist-upgrade

# Install cups
RUN apt-get install --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages cups printer-driver-hpcups

VOLUME /etc/cups/

EXPOSE 631

COPY cupsd.conf /etc/cups/cupsd.conf

CMD ["/usr/sbin/cupsd", "-f"]

