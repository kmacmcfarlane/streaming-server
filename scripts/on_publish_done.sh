#!/bin/bash

appdir=/app
logfile=${appdir}/log/on_publish_done.log
datadir=/mnt/space/streaming-server/streams
app=$1
streamName=$2

mkdir -p ${appdir}/logs

echo --------------------------------------------------------------------------------
echo date: >> ${logfile}
echo app: ${app} >> ${logfile}
echo streamName: ${streamName} >> ${logfile}

aws s3 sync ${datadir}/${app}/ s3://streaming-server-streams/streams/${app}/ >> ${logfile}