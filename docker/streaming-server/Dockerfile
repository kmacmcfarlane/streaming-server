FROM tiangolo/nginx-rtmp

# Install aws cli
RUN apt update &&\
  apt install -y zip unzip &&\
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip awscliv2.zip &&\
  ./aws/install &&\
  apt remove -y zip unzip &&\
  apt clean

RUN mkdir -p /var/log/nginx && mkdir -p /app/log && chmod 777 /app/log

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./scripts /app/scripts/
COPY ./public /app/public/

WORKDIR /app/

RUN mkdir -p /var/log/nginx
