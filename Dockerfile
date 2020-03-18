
FROM nvidia/opencl:latest

ENV DEBIAN_FRONTEND="noninteractive" \
  USERNAME="Anonymous" \
  TEAM="0" \
  PASSWORD="" \
  REMOTE_PASSWORD="override_me" \
  POWER="medium" \
  USE_GPU="true"

ADD config.xml /etc/fahclient/config.xml

RUN apt-get update && apt-get install -y wget && \
  wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb && \
  dpkg -i --force-depends fahclient_7.5.1_amd64.deb && \
  rm fahclient*.deb && \
  apt-get purge --remove wget -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 36330 7396

CMD sed -i "s/{{USERNAME}}/$USERNAME/g;s/{{TEAM}}/$TEAM/g;s/{{PASSWORD}}/$PASSWORD/g;s/{{REMOTE_PASSWORD}}/$REMOTE_PASSWORD/g;s/{{POWER}}/$POWER/g;s/{{USE_GPU}}/$USE_GPU/g" /etc/fahclient/config.xml && \
  /etc/init.d/FAHClient start && \ 
  tail -f /var/lib/fahclient/log.txt
