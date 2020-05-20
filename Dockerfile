FROM haskell:8.6
LABEL maintainer=frankhjung
RUN export TERM=xterm \
    && apt-get --yes --list-cleanup update \
    && apt-get --yes --fix-broken install make cabal-install hasktags hlint stylish-haskell \
    && apt-get --yes autoremove \
    && apt-get --yes autoclean \
    && cabal update \
    && cabal install lens
WORKDIR /opt/workspace
CMD /opt/ghc/8.6.5/bin/ghc --version
