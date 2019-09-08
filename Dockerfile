FROM haskell:8.6.5
LABEL maintainer=frankhjung
RUN export TERM=xterm \
 && apt-get --yes --list-cleanup update \
 && apt-get --yes install hasktags hlint stylish-haskell
WORKDIR /opt/workspace
CMD /opt/ghc/8.6.5/bin/ghc --version
