#!/bin/bash

app=$1
path=$2

echo --------------------------------------------------------------------------------
echo date: `date`
echo app: ${app}
echo path: ${path}
echo id: ${AWS_ACCESS_KEY_ID}
echo secret: ${AWS_SECRET_ACCESS_KEY}

aws s3 mv ${path} s3://streaming-server-streams/streams/${app}/
