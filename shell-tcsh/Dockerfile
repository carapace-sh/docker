FROM ghcr.io/carapace-sh/base

RUN apt-get update && apt-get install -y tcsh

ADD tcshrc.sh /root/.tcshrc

CMD ["tcsh"]
