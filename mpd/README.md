![](https://images.microbadger.com/badges/version/gists/mpd.svg) ![](https://images.microbadger.com/badges/image/gists/mpd.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/mpd>

Automatically built by Github Actions

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

    mpd:
      image: gists/mpd
      ports:
        - "6600:6600"
        - "8000:8000"
      volumes:
        - /your/music:/var/lib/mpd/music
      devices:
        - /dev/snd
      restart: always

#### Client

- mpc: <http://www.musicpd.org/clients/mpc/>
- ncmpc: <http://www.musicpd.org/clients/ncmpc/>
- nncmpp: <https://git.janouch.name/p/nncmpp/>
