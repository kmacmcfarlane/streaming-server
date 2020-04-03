#!/bin/bash

app=$1
path=$2

echo --------------------------------------------------------------------------------
echo date: `date`
echo app: ${app}
echo path: ${path}

aws s3 mv ${path} s3://streaming-server-streams/streams/${app}/
echo done
