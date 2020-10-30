FROM alpine:3.10

ARG version=latest

RUN apk add ca-certificates wget unzip libc6-compat \
    && wget -O c2-latest.zip https://downloads.hak5.org/api/devices/cloudc2/firmwares/${version} --no-cache \ 
    && unzip -j c2-latest '*' -d c2-latest \
    && mkdir /app \
    && mv c2-latest/*_amd64_linux /app/latest_amd64_linux \
    && rm -r c2-latest \
    && chmod +x /app/* \
    && apk del wget unzip

COPY run.sh /app

EXPOSE 8080 2022

CMD /bin/ash /app/run.sh