FROM haskell:8.6
LABEL maintainer=frankhjung
RUN export TERM=xterm \
    && apt-get --yes --list-cleanup update \
    && apt-get --yes --fix-broken install \
        libgl-dev libglu1-mesa-dev libghc-glut-dev \
        freeglut3-dev make cabal-install \
        hasktags hlint stylish-haskell \
    && apt-get --yes autoremove \
    && apt-get --yes autoclean
WORKDIR /opt/workspace
CMD ghc --version
