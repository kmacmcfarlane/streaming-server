FROM golang:latest AS gen
COPY ./ /app
WORKDIR /app
RUN ./gen.sh

FROM tiangolo/nginx-rtmp AS nginx

COPY --from=gen /app/gen/nginx.conf /etc/nginx/nginx.conf
COPY --from=gen /app/script/* /app/script/

RUN apt update &&\
  apt install -y curl unzip &&\
  rm -rf /var/lib/apt/lists/*
RUN curl -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip -q awscliv2.zip &&\
  ./aws/install

RUN chmod 777 /app
ENTRYPOINT nginx -g "daemon off;"
