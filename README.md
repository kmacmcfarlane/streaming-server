# stream-server
A streaming video server that can accept, record, transcode to hls/dash, and relay live streams.

# dependencies
* Go environment https://golang.org/doc/install
* Docker https://docs.docker.com/install/
* Docker Compose https://docs.docker.com/compose/install/

# Usage
## Create a config.json file:
    {
        "server_domain": "example.com",
        "rtmp_servers": [
        {
            "domain": "someplace.com",
            "stream_key": "abc123"
        }]
    }
## Build
    make build

## Run
    make run

## Run in Background
    make daemon

## View logs
    make logs

## Stop Background Daemon
    make stop
