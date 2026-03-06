ARG HASKELL_VERSION=9.6.7
FROM haskell:${HASKELL_VERSION}
ARG HASKELL_VERSION
LABEL maintainer=frankhjung
LABEL version="${HASKELL_VERSION}"
LABEL description="Haskell with: GHC, Cabal, Stack, hlint, yamllint, make"
LABEL git="https://github.com/frankhjung/docker-haskell"
LABEL org.opencontainers.image.source="https://github.com/frankhjung/docker-haskell"
RUN export TERM=xterm \
    && apt-get --yes --list-cleanup update \
    && apt-get --yes upgrade haskell-stack \
    && apt-get --yes --fix-broken install \
    libgl-dev libglu1-mesa-dev libghc-glut-dev \
    freeglut3-dev make cabal-install hasktags yamllint \
    && apt-get --yes autoremove \
    && apt-get --yes autoclean
RUN cabal update \
    && cabal install --overwrite-policy=always hlint ormolu stylish-haskell
WORKDIR /opt/workspace
CMD ghc --version
