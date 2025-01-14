FROM ghcr.io/carapace-sh/base

RUN apt-get update && apt-get install -y fish git libicu72 xonsh zsh

RUN curl -L https://go.dev/dl/go1.23.4.linux-amd64.tar.gz | tar -C /usr/local -xzf -
ENV PATH=$PATH:/usr/local/go/bin

COPY --from=ghcr.io/carapace-sh/shell-bash-ble /usr/local/bin/bash-ble /usr/local/bin/bash-ble
COPY --from=ghcr.io/carapace-sh/shell-bash-ble /root/.config/bash-ble /root/.config/bash-ble

COPY --from=ghcr.io/carapace-sh/shell-elvish /usr/local/bin/elvish /usr/local/bin/elvish
COPY --from=ghcr.io/carapace-sh/shell-elvish /root/.config/elvish /root/.config/elvish

COPY --from=ghcr.io/carapace-sh/shell-fish /root/.config/fish /root/.config/fish

COPY --from=ghcr.io/carapace-sh/shell-nushell /usr/local/bin/nu /usr/local/bin/nu
COPY --from=ghcr.io/carapace-sh/shell-nushell /root/.config/nushell /root/.config/nushell

COPY --from=ghcr.io/carapace-sh/shell-oil /usr/local/bin/osh /usr/local/bin/osh
COPY --from=ghcr.io/carapace-sh/shell-oil /root/.config/oils /root/.config/oils

COPY --from=ghcr.io/carapace-sh/shell-powershell /opt/microsoft/ /opt/microsoft
COPY --from=ghcr.io/carapace-sh/shell-powershell /root/.config/powershell/ /root/.config/powershell
RUN ln -s /opt/microsoft/powershell/7/pwsh /usr/local/bin/pwsh

COPY --from=ghcr.io/carapace-sh/shell-xonsh /root/.config/xonsh /root/.config/xonsh

COPY --from=ghcr.io/carapace-sh/shell-zsh /root/.zshrc /root/.zshrc

CMD ["elvish"]
