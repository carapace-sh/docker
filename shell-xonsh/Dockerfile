FROM ghcr.io/carapace-sh/base

RUN apt-get update && apt-get install -y xonsh

ADD rc.xsh /root/.config/xonsh/

CMD ["xonsh"]
