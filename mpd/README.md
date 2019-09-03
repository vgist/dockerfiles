![](https://images.microbadger.com/badges/version/gists/mpd.svg) ![](https://images.microbadger.com/badges/image/gists/mpd.svg) ![](https://img.shields.io/docker/stars/gists/mpd.svg) ![](https://img.shields.io/docker/pulls/gists/mpd.svg)

#### Volume

- /var/lib/mpd

#### Custom usage:

    docker run \
        -d \
        --name mpd \
        --device /dev/snd \
        -p 6600:6600 \
        -p 8000:8000 \
        -v /your/music:/var/lib/mpd/music \
        gists/mpd

#### Compose example:

    transmission:
      image: gists/mpd
      ports:
        - "6600:6600"
        - "8000:8000"
      volumes:
        - /your/music:/var/lib/mpd/music
      devices:
        - /dev/snd
      restart: always
