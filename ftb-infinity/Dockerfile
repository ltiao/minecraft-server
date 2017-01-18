FROM openjdk:8-jre

# File downloads and checksums for various versions listed at:
# https://www.feed-the-beast.com/projects/ftb-infinity-evolved/files
# Link below is for: FTBInfinity-2.6.0-1.7.10
ARG FTB_DOWNLOAD_URL=https://www.feed-the-beast.com/projects/ftb-infinity-evolved/files/2320899/download
ARG FTB_DOWNLOAD_CHECKSUM=6678812e62d38200734ed87a40617e6c

RUN wget -O /tmp/FTBInfinityEvolvedServer.zip ${FTB_DOWNLOAD_URL} \
 && echo "${FTB_DOWNLOAD_CHECKSUM}  /tmp/FTBInfinityEvolvedServer.zip" | md5sum --check - \
 && unzip -d /tmp/FTBInfinityEvolvedServer /tmp/FTBInfinityEvolvedServer.zip \
 && sh /tmp/FTBInfinityEvolvedServer/FTBInstall.sh \
 && rm /tmp/FTBInfinityEvolvedServer.zip

VOLUME /data
WORKDIR /data

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh 

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-server", \
     "-Xms512M", \
     "-Xmx2048M", \
     "-XX:PermSize=256M", \
     "-XX:+UseParNewGC", \
     "-XX:+CMSIncrementalPacing", \
     "-XX:+CMSClassUnloadingEnabled", \
     "-XX:ParallelGCThreads=2", \
     "-XX:MinHeapFreeRatio=5", \
     "-XX:MaxHeapFreeRatio=10", \
     "-jar", "/tmp/FTBInfinityEvolvedServer/FTBServer-1.7.10-1614.jar", "nogui"]
