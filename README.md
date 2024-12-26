This is just a playwright docker image with xvfb+x11vnc installed.

# Usage:

An reference `compose.yaml` is provided, feel free to modify it and use it like:

```
docker compose run --rm -i -P playwright bash -il
```

The entrypoint launches x11vnc, you can connect from your host with:

```
vncviewer localhost:5900
```
