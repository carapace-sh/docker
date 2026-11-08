FROM ghcr.io/carapace-sh/base
ARG version=0.4.52
ARG asciinema_version=0.0.3

RUN apt-get update && apt-get install -y git jq unzip

RUN git config --system safe.directory '*'

RUN curl -L "https://github.com/rust-lang/mdBook/releases/download/v${version}/mdbook-v${version}-x86_64-unknown-linux-gnu.tar.gz" | tar -xvz mdbook \
 && mv mdbook /usr/local/bin/

RUN curl -L "https://github.com/marxin/mdbook-linkcheck2/releases/download/v0.13.0/mdbook-linkcheck2-x86_64-unknown-linux-gnu.tar.gz" | tar -xvz mdbook-linkcheck2 \
 && mv mdbook-linkcheck2 /usr/local/bin/
RUN curl -L "https://github.com/carapace-sh/mdbook-asciinema/releases/download/v${asciinema_version}/mdbook-asciinema_${asciinema_version}_linux_amd64.tar.gz" | tar -xvz mdbook-asciinema \
 && mv mdbook-asciinema /usr/local/bin/
