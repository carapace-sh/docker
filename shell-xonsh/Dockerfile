FROM ghcr.io/carapace-sh/base

RUN apt-get update && apt-get install -y python3-pip \
    && pip3 install --break-system-packages 'xonsh[full]'

ADD rc.xsh /root/.config/xonsh/

CMD ["xonsh"]
