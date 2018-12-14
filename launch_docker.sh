#!/bin/sh -x
# Based on https://github.com/tzutalin/labelImg/blob/master/README.rst


#IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
#-e DISPLAY=$IP:0 \

# MacOS XQuartz OK
xhost + 127.0.0.1

docker run -it \
--rm \
-e DISPLAY=host.docker.internal:0 \
-v $(pwd):/workspace \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $1:/workspace/annotation \
--workdir=/workspace \
tzutalin/py2qt4 \
./labelImg.py
