FROM tiangolo/nginx-rtmp

# Install aws cli
RUN apt update &&\
  apt install -y zip unzip &&\
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip awscliv2.zip &&\
  ./aws/install &&\
  apt remove -y zip unzip &&\
  apt clean &&\
  wget https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz &&\
  tar -C /usr/local -zxf go1.14.1.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

COPY ./ /app
WORKDIR /app/

RUN make gen && cp gen/nginx.conf /etc/nginx/nginx.conf && mkdir -p /var/log/nginx
