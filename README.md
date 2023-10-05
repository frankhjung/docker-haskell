# docker-haskell

[Debian](https://hub.docker.com/_/debian) based image for building Haskell
projects using [GHC](https://www.haskell.org/ghc/). This includes [GNU
make](https://www.gnu.org/software/make/).

The latest Docker image can be found on [Docker Hub](https://cloud.docker.com),
[here](https://cloud.docker.com/repository/docker/frankhjung/haskell/general).

## Login

Prior to build, log into Docker Hub:

```bash
echo [personal access token] | docker login -u [username] --password-stdin
```

## Build

To build image with version tags:

```bash
export VERSION=9.4.7
docker build --compress --rm --tag frankhjung/haskell:${VERSION} --label ${VERSION} .
```

## Verify

```bash
export VERSION=9.4.7
docker run -it --volume ${PWD}:/data --workdir /data frankhjung/haskell:${VERSION}
```

Which should give this response:

  The Glorious Glasgow Haskell Compilation System, version 9.4.7

## Tag

To tag with `latest`:

```bash
export VERSION=9.4.7
docker tag frankhjung/haskell:${VERSION} frankhjung/haskell:latest
```

Verify with:

```bash
$ docker image inspect --format='{{json .Config.Labels}}' frankhjung/haskell:latest
{"9.4.7":"","maintainer":"frankhjung"}
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
