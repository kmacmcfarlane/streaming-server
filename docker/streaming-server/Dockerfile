FROM tiangolo/nginx-rtmp
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/log/nginx

ENTRYPOINT mkdir -p /mnt/space/streaming-server/streams/hls &&\
  mkdir -p /mnt/space/streaming-server/streams/rtmp &&\
  chown -R nobody:nogroup /mnt/space &&\
  nginx -g "daemon off;"