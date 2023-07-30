# docker-haskell

[Debian](https://hub.docker.com/_/debian) based image for building Haskell
projects using [GHC](https://www.haskell.org/ghc/). This includes [GNU
make](https://www.gnu.org/software/make/).

The latest Docker image can be found on [Docker Hub](https://cloud.docker.com),
[here](https://cloud.docker.com/repository/docker/frankhjung/haskell/general).

## Login

Prior to build, log into Docker Hub:

```bash
docker login -u [username] --password-stdin
```

## Build

To build image with version tags:

```bash
export VERSION=9.2.8
docker build --compress --rm --tag frankhjung/haskell:${VERSION} --label ${VERSION} .
```

## Run

To test image run with:

```bash
export VERSION=9.2.8
docker run -it --volume ${PWD}:/data --workdir /data --entrypoint /usr/bin/make frankhjung/haskell:${VERSION} -f Makefile all
```

## Tag

To tag with `latest`:

```bash
export VERSION=9.2.8
docker tag frankhjung/haskell:${VERSION} frankhjung/haskell:latest
```

Verify with:

```bash
$ docker image inspect --format='{{json .Config.Labels}}' frankhjung/haskell:latest
{"9.2.8":"","maintainer":"frankhjung"}
```

## Push

Push image and all tags to Docker Hub:

```bash
docker push -a frankhjung/haskell
```

### Example

For examples see these projects using GitHub Actions.

* [Haskell GCD](https://github.com/frankhjung/haskell-gcd)
* [Haskell Scrapbook](https://github.com/frankhjung/haskell-scrapbook)

## Links

* [Docker Hub: Haskell](https://hub.docker.com/_/haskell)
* [Stackage Resolvers](https://www.stackage.org)
