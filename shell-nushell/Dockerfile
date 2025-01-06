FROM ghcr.io/carapace-sh/base
ARG version=0.101.0

RUN curl -L https://github.com/nushell/nushell/releases/download/${version}/nu-${version}-x86_64-unknown-linux-gnu.tar.gz | tar -xvz \
 && mv nu-${version}-x86_64-unknown-linux-gnu/nu /usr/local/bin

ADD config.nu /root/.config/nushell/
ADD env.nu /root/.config/nushell/

CMD ["nu"]
