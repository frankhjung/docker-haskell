# docker-haskell

[Debian](https://hub.docker.com/_/debian) based image for building Haskell
projects using [GHC](https://www.haskell.org/ghc/). This includes [GNU
make](https://www.gnu.org/software/make/).

The latest Docker image can be found on [Docker Hub](https://cloud.docker.com),
[here](https://cloud.docker.com/repository/docker/frankhjung/haskell/general).

## Build

```bash
docker build --compress --rm --tag frankhjung/haskell:latest --tag frankhjung/haskell:8.6 --label 8.6 .
```

## Run

```bash
docker run -it --volume ${PWD}:/data --workdir /data --entrypoint /usr/bin/make frankhjung/haskell:8.6 -f Makefile all
```

### Example

For examples see these projects using GitHub Actions.

* [Haskell GCD](https://github.com/frankhjung/haskell-gcd)
* [Haskell Scrapbook](https://github.com/frankhjung/haskell-scrapbook)

## Links

* [Docker Hub: Haskell](https://hub.docker.com/_/haskell)
* [Stackage Resolvers](https://www.stackage.org)
