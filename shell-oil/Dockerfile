FROM ghcr.io/carapace-sh/base AS oil
ARG version=0.37.0

RUN apt-get update && apt-get install -y gcc g++ make libreadline-dev
RUN curl http://oils.pub/download/oils-for-unix-${version}.tar.gz | tar -xvz \
  && cd oils-*/ \
  && ./configure \
  && _build/oils.sh \
  && ./install

FROM ghcr.io/carapace-sh/base
COPY --from=oil /usr/local/bin/* /usr/local/bin/

RUN apt-get update && apt-get install -y libreadline-dev

ADD oshrc.sh /root/.config/oils/oshrc

CMD ["osh"]
