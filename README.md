# docker-haskell

[Debian](https://hub.docker.com/_/debian) based image for building Haskell
projects using [GHC](https://www.haskell.org/ghc/). This includes [GNU
make](https://www.gnu.org/software/make/).

## Images

This Docker image is available from two container registries:

### Image on Docker Hub

The Docker Hub image can be found at:
[frankhjung/haskell](https://hub.docker.com/r/frankhjung/haskell)

To pull from Docker Hub:

```bash
docker pull frankhjung/haskell:latest
```

Or with a specific version:

```bash
docker pull frankhjung/haskell:9.6.7
```

### Image on GitHub Container Registry (GHCR)

The [GHCR](https://docs.github.com/en/packages) image can be found at:
[ghcr.io/frankhjung/docker-haskell](https://github.com/frankhjung/docker-haskell/pkgs/container/docker-haskell)

To pull from GHCR:

```bash
docker pull ghcr.io/frankhjung/docker-haskell:latest
```

Or with a specific version:

```bash
docker pull ghcr.io/frankhjung/docker-haskell:9.6.7
```

**Note:** Public images on GHCR are free to store and pull.

## Configuration

### Haskell Version

The Haskell version is configured using the GitHub variable `HASKELL_VERSION`.
This variable is referenced in:

1. The [Dockerfile](./Dockerfile) via ARG
2. The [docker-hub.yml](.github/workflows/docker-hub.yml) workflow
3. The [ghcr.yml](.github/workflows/ghcr.yml) workflow

To change the version, update the `HASKELL_VERSION` repository variable in
GitHub.

## Local Development

### Login

Prior to building locally, log into Docker Hub:

```bash
echo [personal access token] | docker login -u [username] --password-stdin
```

Or for GHCR:

```bash
echo [personal access token] | docker login ghcr.io -u [username] --password-stdin
```

### Version

Set version for local session:

```bash
export VERSION=9.6.7
```

### Build

To build image locally with version tags:

```bash
docker build --compress --rm --tag frankhjung/haskell:${VERSION} --label ${VERSION} .
```

Or for GHCR:

```bash
docker build --compress --rm --tag ghcr.io/frankhjung/docker-haskell:${VERSION} --label ${VERSION} .
```

## Verify

```bash
docker run -it --volume ${PWD}:/data --workdir /data frankhjung/haskell:${VERSION}
```

  The Glorious Glasgow Haskell Compilation System, version 9.6.7

## Run

Single command:

```bash
docker container run -it frankhjung/haskell sh -c "hlint --version"
```

  HLint v3.8, (C) Neil Mitchell 2006-2024

Interactively:

```bash
docker container run -it frankhjung/haskell bash
```

## Tag

### Tag with Docker Hub

To tag with `latest` on Docker Hub:

```bash
docker tag frankhjung/haskell:${VERSION} frankhjung/haskell:latest
```

### Tag with GHCR

To tag with `latest` on GHCR:

```bash
docker tag ghcr.io/frankhjung/docker-haskell:${VERSION} ghcr.io/frankhjung/docker-haskell:latest
```

Verify tags with:

```bash
docker image inspect --format='{{json .Config.Labels}}' frankhjung/haskell:latest
```

Or for GHCR:

```bash
docker image inspect --format='{{json .Config.Labels}}' ghcr.io/frankhjung/docker-haskell:latest
```

## Push

### Push to Docker Hub

Push image and all tags to Docker Hub:

```bash
docker push -a frankhjung/haskell
```

### Push to GHCR

Push image and all tags to GHCR:

```bash
docker push -a ghcr.io/frankhjung/docker-haskell:latest
```

**Note:** GitHub Actions workflows automatically build and push images on push
to master.

### Example

For examples see these projects using GitHub Actions.

* [Haskell GCD](https://github.com/frankhjung/haskell-gcd)
* [Haskell Scrapbook](https://github.com/frankhjung/haskell-scrapbook)

## Links

* [Docker Hub: Haskell](https://hub.docker.com/_/haskell)
* [Stackage Resolvers](https://www.stackage.org)
