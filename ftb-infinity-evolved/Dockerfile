FROM openjdk:8-jre

ENV FTB_DOWNLOAD_URL http://ftb.cursecdn.com/FTB2/modpacks/FTBInfinity/2_6_0/FTBInfinityServer.zip

RUN wget -q -O FTBInfinityServer.zip ${FTB_DOWNLOAD_URL} \
 && unzip -q -d /tmp/FTBInfinityServer FTBInfinityServer.zip

COPY server.properties /tmp/server.properties
COPY ServerStart.sh /tmp/ServerStart.sh

RUN groupadd -r minecraft && useradd -r -g minecraft minecraft

RUN mkdir /data && chown minecraft:minecraft /data
VOLUME /data
WORKDIR /data

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 25565
