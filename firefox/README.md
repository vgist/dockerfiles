![](https://img.shields.io/badge/firefox-49.0-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-edge-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/firefox.svg) ![](https://img.shields.io/docker/pulls/gists/firefox.svg)

#### Environment:

| Environment | Default value |
|-------------|---------------|
| UID         | 1000          |
| GID         | 1000          |

#### Creating an instance:

    docker run \
        -d \
        --name firefox \
        -e DISPLAY=$DISPLAY \
        -e UID=1000 \
        -e GID=1000 \
        -v /tmp/.X11-unix:/tmp/.X11-unix
        -v /dev/snd:/dev/snd
        gists/firefox

#### Note:

If you receive the following error

    Gtk-WARNING **: cannot open display: :1

You should allow the docker user to communicate with your X

    xhost +local:docker
    or
    xhost +local:root
