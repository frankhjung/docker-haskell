FROM haskell:8.10.7
LABEL maintainer=frankhjung
RUN export TERM=xterm \
    && apt-get --yes --list-cleanup update \
    && apt-get --yes upgrade haskell-stack \
    && apt-get --yes --fix-broken install \
    libgl-dev libglu1-mesa-dev libghc-glut-dev \
    freeglut3-dev make cabal-install \
    hasktags hlint stylish-haskell yamllint \
    && apt-get --yes autoremove \
    && apt-get --yes autoclean
WORKDIR /opt/workspace
CMD ghc --version
