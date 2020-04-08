FROM tiangolo/nginx-rtmp

# Install aws cli
RUN apt-get -qq update &&\
  apt-get -qq install zip unzip &&\
  curl -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip -q awscliv2.zip &&\
  ./aws/install &&\
  apt-get -qq remove -y zip unzip &&\
  apt-get -qq clean &&\
  wget -q https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz &&\
  tar -C /usr/local -zxf go1.14.1.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

COPY ./ /app
WORKDIR /app/

RUN make gen && cp gen/nginx.conf /etc/nginx/nginx.conf && mkdir -p /var/log/nginx
