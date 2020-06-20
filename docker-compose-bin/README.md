# docker-compose binary file

Fork from <https://github.com/ubiquiti/docker-compose-aarch64>

This repository contains helpers to build a docker-compose binary file for other platform (e.g. arm). Because, docker-compose [releases](https://github.com/docker/compose/releases) don't include any arm binary files currently.

Automatically built by Github Actions

- [Dockerfile](https://github.com/vgist/dockerfiles/blob/master/docker-compose-bin/Dockerfile)
- [workflow](https://github.com/vgist/dockerfiles/blob/master/.github/workflows/docker-compose-bin.yml)

Support architectures: `arm32v6`, `amd64`, `arm32v7`, `arm64v8`, `i386`

## Get binary docker-compose on your current platform

```bash
docker run --rm -v /usr/local/bin:/dist gists/docker-compose-bin:latest && docker rmi gists/docker-compose-bin:latest
```

You may need `sudo` to run. It will download latest image, and run it to generate the binary docker-compose in `/usr/local/bin`.
