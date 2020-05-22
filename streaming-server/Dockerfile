FROM golang:latest AS gen-conf

COPY config.json /app/
COPY config.schema.json /app/
COPY streaming-server /app/streaming-server
WORKDIR /app/streaming-server/
RUN go build -o ./bin/template_tool ./internal/cmd/template_tool &&\
    mkdir ./gen &&\
    ./bin/template_tool --template ./template/credentials.tmpl --config ../config.json --out ./gen/credentials --schema ../config.schema.json &&\
    ./bin/template_tool --template ./template/nginx.conf.tmpl --config ../config.json --out ./gen/nginx.conf --schema ../config.schema.json


FROM tiangolo/nginx-rtmp AS nginx

COPY --from=gen-conf /app/config.json /app/
COPY --from=gen-conf /app/streaming-server/gen/nginx.conf /etc/nginx/nginx.conf
COPY --from=gen-conf /app/streaming-server/gen/credentials /home/root/.aws/credentials
COPY --from=gen-conf /app/streaming-server/script/ /app/

RUN apt update &&\
  apt install -y curl unzip &&\
  rm -rf /var/lib/apt/lists/* &&\
  curl -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip -q awscliv2.zip &&\
  ./aws/install &&\
  rm awscliv2.zip &&\
  chmod 777 /app &&\
  chmod 600 /home/root/.aws/credentials

ENTRYPOINT nginx -g "daemon off;"
