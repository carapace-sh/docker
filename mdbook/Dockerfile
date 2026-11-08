FROM ghcr.io/carapace-sh/base
ARG version=0.4.52
ARG asciinema_version=0.0.2

RUN apt-get update && apt-get install -y git jq unzip

RUN git config --system safe.directory '*'

RUN curl -L "https://github.com/rust-lang/mdBook/releases/download/v${version}/mdbook-v${version}-x86_64-unknown-linux-gnu.tar.gz" | tar -xvz mdbook \
 && mv mdbook /usr/local/bin/

RUN curl -L "https://github.com/Michael-F-Bryan/mdbook-linkcheck/releases/download/v0.7.7/mdbook-linkcheck.x86_64-unknown-linux-gnu.zip" > mdbook-linkcheck.zip \
 && unzip mdbook-linkcheck.zip mdbook-linkcheck \
 && rm mdbook-linkcheck.zip \
 && chmod +x mdbook-linkcheck \
 && mv mdbook-linkcheck /usr/local/bin/
RUN curl -L "https://github.com/carapace-sh/mdbook-asciinema/releases/download/v${asciinema_version}/mdbook-asciinema_${asciinema_version}_linux_amd64.tar.gz" | tar -xvz mdbook-asciinema \
 && mv mdbook-asciinema /usr/local/bin/
