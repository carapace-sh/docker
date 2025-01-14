FROM ghcr.io/carapace-sh/dev

RUN apt-get update && apt-get install -y chromium ffmpeg fonts-jetbrains-mono

RUN curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 > /usr/local/bin/ttyd \
 && chmod +x /usr/local/bin/ttyd

RUN git clone https://github.com/rsteube/vhs --depth 1 \
 && cd vhs \
 && GOBIN=/usr/local/bin/ go install

ENV VHS_NO_SANDBOX 1
