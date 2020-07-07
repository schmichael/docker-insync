#!/bin/bash

# lol don't do this
# undo this bad idea with: xhost -local:root
xhost +local:root

# run the thing
docker run -e "DISPLAY=unix${DISPLAY}" -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm:/dev/shm --net=host docker-insync

# undo the bad idea
xhost -local:root
