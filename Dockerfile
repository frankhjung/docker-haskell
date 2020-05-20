FROM haskell:8.6
LABEL maintainer=frankhjung
RUN export TERM=xterm \
    && apt-get --yes --list-cleanup update \
    && apt-get --yes --fix-broken install make cabal-install hasktags hlint stylish-haskell \
    && apt-get --yes autoremove \
    && apt-get --yes autoclean
WORKDIR /opt/workspace
CMD ghc --version