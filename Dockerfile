FROM ubuntu:16.04
RUN apt-get update
RUN echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" > /etc/apt/sources.list.d/100-ubnt.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 && \
    apt-get update
RUN apt-get install -y unifi
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8443

ENTRYPOINT service unifi start && \
            tail -f /usr/lib/unifi/logs/server.log
