# stream-server
A streaming video server that can accept, record, transcode to hls/dash, and relay live streams. Includes a simple frontend that can list recordings, play recordings, and watch streams live.

# Dependencies
* JQ https://stedolan.github.io/jq/download/
* Docker https://docs.docker.com/install/
* Docker Compose https://docs.docker.com/compose/install/

# Usage
## Create a config.json file, see config.example.json:
    cp config.example.json config.json
    vi config.json
    
## Build
    make build

## Run
    make run

## Run in Background
    make daemon

## Follow Logs When in Background
    make logs

## Stop Background Daemon
    make stop
