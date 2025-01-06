FROM ghcr.io/carapace-sh/base AS bash-ble

RUN apt-get update && apt-get install -y gawk git make
RUN git clone --recursive https://github.com/akinomyoga/ble.sh \
 && make -C ble.sh

FROM ghcr.io/carapace-sh/base
COPY --from=bash-ble /ble.sh/out /root/.config/bash-ble/ble

RUN apt-get update && apt-get install -y procps

ADD blerc.sh /root/.config/bash-ble/blerc
ADD bash-ble.sh /usr/local/bin/bash-ble

CMD ["bash-ble"]
