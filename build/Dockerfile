FROM golang:bookworm AS build
LABEL org.opencontainers.image.source https://github.com/carapace-sh/docker

# USER root

RUN apt-get update \
 && apt-get install -y \
                    shellcheck \
                    sudo 

RUN git config --system safe.directory '*'
