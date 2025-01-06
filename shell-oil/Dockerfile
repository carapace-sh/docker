FROM ghcr.io/carapace-sh/base AS oil
ARG version=0.24.0

RUN apt-get update && apt-get install -y gcc make libreadline-dev
RUN curl https://www.oilshell.org/download/oil-${version}.tar.gz | tar -xvz \
  && cd oil-*/ \
  && ./configure \
  && make \
  && ./install

FROM ghcr.io/carapace-sh/base
COPY --from=oil /usr/local/bin/* /usr/local/bin/

RUN apt-get update && apt-get install -y libreadline-dev

ADD oshrc.sh /root/.config/oils/oshrc

CMD ["osh"]
