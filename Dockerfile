FROM alpine:3.11
ENV KUBE_VERSION=v1.17.3
RUN apk add --no-cache \
    ca-certificates~=20191127-r1 \
    less~=551-r0 \
    ncurses-terminfo-base~=6.1_p20191130-r0 \
    krb5-libs~=1.17.1-r0 \
    libgcc~=9.2.0 \
    libintl~=0.20.1 \
    libssl1.1~=1.1.1d \
    libstdc++~=9.2.0 \
    tzdata~=2019c \
    userspace-rcu~=0.11.1 \
    zlib~=1.2.11 \
    icu-libs~=64.2 \
    curl~=7.67.0 \
    lttng-ust~=2.10.4 \
    && curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.0.0-preview.4/powershell-7.0.0-preview.4-linux-alpine-x64.tar.gz -o /tmp/powershell.tar.gz \
    && mkdir -p /opt/microsoft/powershell/7-preview \
    && tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7-preview \
    && chmod +x /opt/microsoft/powershell/7-preview/pwsh \
    && ln -s /opt/microsoft/powershell/7-preview/pwsh /usr/bin/pwsh \
    && pwsh -c Install-Module  -Name Az -AllowClobber -Scope AllUsers -Force \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl
ENTRYPOINT [ "pwsh" ]
