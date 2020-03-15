
FROM nvidia/cuda:latest

ENV DEBIAN_FRONTEND noninteractive

ENV USERNAME Anonymous
ENV TEAM 0
ENV PASSWORD ""
ENV REMOTE_PASSWORD "override_me"
ENV POWER medium

ADD config.xml /etc/fahclient/config.xml

WORKDIR /tmp

RUN apt-get update && apt-get install -y wget && \
  wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb && \
  dpkg -i --force-depends fahclient_7.5.1_amd64.deb && \
  rm fahclient*.deb && \
  apt-get purge --remove wget -y && \
  apt-get autoremove -y

EXPOSE 36330 7396

CMD /etc/init.d/FAHClient start && tail -f /var/lib/fahclient/log.txt