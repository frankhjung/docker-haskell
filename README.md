# docker-haskell

Docker image for a Haskell toolchain, built on top of the official
[`haskell`](https://hub.docker.com/_/haskell) image.

The image version is controlled by `ARG HASKELL_VERSION` in `Dockerfile`
(currently `9.6.7`).

## What Is Included

From the base image and install steps in `Dockerfile`, the container includes:

- GHC / `haskell`
- Cabal
- Stack
- GNU Make
- `hlint`, `ormolu`, `stylish-haskell`
- `yamllint`, `hasktags`
- OpenGL/GLUT development packages

Default container command:

```bash
ghc --version
```

## Requirements

- Docker with Buildx support
- GNU Make

You can override the Docker CLI command used by Make with `DOCKER`.

## Make Targets

Show available targets:

```bash
make help
```

Main targets:

- `make build-image`: Builds tags `haskell:<HASKELL_VERSION>` and
  `haskell:latest`
- `make version`: Builds the image and runs `haskell --version` inside it
- `make images`: Lists local images named `haskell`
- `make doctor`: Prints Docker context, contexts list, Buildx builders, and
  project images

`make` defaults to `make version`.

## Build Manually

If you prefer direct Docker commands:

```bash
docker buildx build --load \
  --build-arg HASKELL_VERSION=9.6.7 \
  --tag haskell:9.6.7 \
  --tag haskell:latest \
  .
```

## Run Examples

Check the compiler version:

```bash
docker run --rm haskell:latest ghc --version
```

Check formatter/linter tooling:

```bash
docker run --rm haskell:latest hlint --version
docker run --rm haskell:latest ormolu --version
docker run --rm haskell:latest stylish-haskell --version
```

Open an interactive shell:

```bash
docker run --rm -it haskell:latest bash
```

## Change Haskell Version

Update the first line in `Dockerfile`:

```dockerfile
ARG HASKELL_VERSION=<new-version>
```

Then rebuild:

```bash
make build-image
```
