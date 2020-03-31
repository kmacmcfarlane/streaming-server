FROM tiangolo/nginx-rtmp

# Install aws cli
RUN apt update &&\
  apt install -y zip unzip &&\
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip awscliv2.zip &&\
  ./aws/install &&\
  apt remove -y zip unzip &&\
  apt clean

ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESSKEY=${AWS_SECRET_ACCESS_KEY}

RUN mkdir ~/.aws && echo "[default]\n\
aws_access_key_id = ${AWS_ACCESS_KEY_ID}\n\
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

RUN mkdir -p /var/log/nginx && mkdir -p /app/log

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./scripts /app/scripts/
COPY ./public /app/public/

WORKDIR /app/

RUN mkdir -p /var/log/nginx