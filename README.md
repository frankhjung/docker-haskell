# docker-haskell

[Debian](https://hub.docker.com/_/debian) based image for building Haskell
projects using [GHC](https://www.haskell.org/ghc/). This includes [GNU
make](https://www.gnu.org/software/make/).

The latest Docker image can be found on [Docker Hub](https://cloud.docker.com),
[here](https://cloud.docker.com/repository/docker/frankhjung/haskell/general).

## Login

Prior to build, log into Docker Hub:

```bash
docker login -u [username]
```

## Build

To build image with version tags:

```bash
docker build --compress --rm --tag frankhjung/haskell:8.6 --tag frankhjung/haskell:8.6.5 --label 8.6 --label 8.6.5 .
```

## Run

To test image run with:

```bash
docker run -it --volume ${PWD}:/data --workdir /data --entrypoint /usr/bin/make frankhjung/haskell:8.6 -f Makefile all
```

## Push

Push image and tags to Docker Hub:

```bash
docker push frankhjung/haskell
docker push frankhjung/haskell:8.6
docker push frankhjung/haskell:8.6.5
```

### Example

For examples see these projects using GitHub Actions.

* [Haskell GCD](https://github.com/frankhjung/haskell-gcd)
* [Haskell Scrapbook](https://github.com/frankhjung/haskell-scrapbook)

## Links

* [Docker Hub: Haskell](https://hub.docker.com/_/haskell)
* [Stackage Resolvers](https://www.stackage.org)
