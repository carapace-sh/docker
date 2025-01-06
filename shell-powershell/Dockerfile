FROM ghcr.io/carapace-sh/base
ARG version=7.4.6
ARG build=1

RUN apt-get update && apt-get install -y libicu72
RUN curl -L  https://github.com/PowerShell/PowerShell/releases/download/v${version}/powershell_${version}-${build}.deb_amd64.deb > powershell.deb  \
  && dpkg -i powershell.deb \
  && rm powershell.deb

ADD profile.ps1 /root/.config/powershell/

CMD ["pwsh"]
