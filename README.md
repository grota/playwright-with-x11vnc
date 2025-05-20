# Description

This is just a playwright docker image with xvfb+x11vnc installed.

## Usage

### Via docker

You can run it with docker via:

```
# interactive
docker run --rm --publish 5900:5900 --entrypoint='' -it ghcr.io/grota/playwright-with-x11vnc:v1.52.0 bash -il
/start-vnc.sh

# in background
docker run --rm --publish 5900:5900 ghcr.io/grota/playwright-with-x11vnc:v1.52.0
```

### Via docker compose

An additional docker compose `compose.yaml` reference file is provided, feel
free to modify it and use it like:

```
# interactive
docker compose run --rm --entrypoint='' --service-ports playwright bash -il
/start-vnc.sh

# in background
docker compose run --rm --service-ports --detach playwright bash -il
```

### Connect from host via VNC client

The entrypoint launches x11vnc, you can connect from your host with:

```
vncviewer localhost:5900
```

## Build

Build with a simple `docker buildx build -t <TAGNAME> .`
