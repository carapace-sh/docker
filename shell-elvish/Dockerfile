FROM ghcr.io/carapace-sh/base
ARG version=0.21.0

RUN curl https://dl.elv.sh/linux-amd64/elvish-v${version}.tar.gz | tar -xvz \
  && mv elvish /usr/local/bin/elvish

ADD rc.elv /root/.config/elvish/

CMD ["elvish"]
