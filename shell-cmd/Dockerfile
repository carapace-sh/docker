FROM ghcr.io/carapace-sh/base

RUN apt-get update && apt-get install -y wine

ADD cmd.sh /usr/local/bin/cmd
RUN chmod +x /usr/local/bin/cmd \
 && cmd /c echo

CMD ["cmd"]
