Dockerfile <https://github.com/vgist/dockerfiles/tree/master/mpd>

Automatically built by Github Actions

#### Volume

- /music
- /var/lib/mpd/playlists

#### Custom usage:

    docker run \
        -d \
        --name mpd \
        --device /dev/snd \
        -p 6600:6600 \
        -p 8000:8000 \
        -v /your/music:/music \
        -v /your/playlists:/var/lib/mpd/playlists \
        gists/mpd

#### Compose example:

    mpd:
      image: gists/mpd
      ports:
        - "6600:6600"
        - "8000:8000"
      volumes:
        - /your/music:/music
        - /your/playlists:/var/lib/mpd/playlists \
      devices:
        - /dev/snd
      restart: always

#### Client

- mpc: <http://www.musicpd.org/clients/mpc/>
- ncmpc: <http://www.musicpd.org/clients/ncmpc/>
- nncmpp: <https://git.janouch.name/p/nncmpp/>
