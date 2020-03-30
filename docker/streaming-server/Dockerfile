FROM tiangolo/nginx-rtmp
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/log/nginx &&\
  mkdir -p /mnt/space/streaming-server/streams/hls &&\
  mkdir -p /mnt/space/streaming-server/streams/live
