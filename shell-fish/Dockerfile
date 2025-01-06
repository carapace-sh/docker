FROM ghcr.io/carapace-sh/base

RUN apt-get update && apt-get install -y fish

ADD config.fish /root/.config/fish/

CMD ["fish"]
