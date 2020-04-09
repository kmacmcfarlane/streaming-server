#!/bin/bash

app=$1
path=$2

echo --------------------------------------------------------------------------------
echo date: `date` &>> /app/error.log
echo app: ${app} &>> /app/error.log
echo path: ${path} &>> /app/error.log

aws s3 mv ${path} s3://streaming-server-streams/streams/${app}/ &>> /app/error.log
echo done &>> /app/error.log
