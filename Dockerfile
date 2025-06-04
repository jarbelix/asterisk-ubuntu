# Use uma versão LTS específica do Ubuntu para maior consistência
# 24.04 - noble, 22.04 - jammy, 20.04 - focal, 18.04 - squeeze
ARG UBUNTU_LTS_VERSION=24.04
FROM ubuntu:${UBUNTU_LTS_VERSION}

# Define variáveis de ambiente
ENV _ETC="/etc/asterisk"

# Definir alguns metadados
LABEL maintainer="Tiozão do Linux <jarbas.junior@gmail.com>"
LABEL author="Jarbas <jarbas.junior@gmail.com>"

# Desabilitar modo interativo para pacotes do debian apenas na fase de construção
ARG DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN <<EOF
apt-get update
apt-get install -y asterisk asterisk-mysql asterisk-mp3 asterisk-ooh323
apt-get install -y lame htop tree iputils-ping curl jq
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

WORKDIR $_ETC

# Copiar arquivos do /root
COPY root/ /root/

# Copia e torna executável o script de profile
COPY --chmod=u+x etc/profile.d/asterisk.sh /etc/profile.d/asterisk.sh

# Copia arquivos de configuração do Asterisk
COPY --chown=asterisk:asterisk etc/asterisk/ /etc/asterisk/
COPY --chown=asterisk:asterisk etc/asterisk/manager.d/ /etc/asterisk/manager.d/

# Copia arquivos de configuração do MySQL
COPY --chown=asterisk:asterisk var/lib/asterisk/moh/ var/lib/asterisk/moh/

# Expõe as portas padrão do Asterisk (documentação)
# 5060/udp (SIP)
# 5060/tcp (SIP, se usado)
# 5061/tcp (SIP TLS, se usado)
# 10000-20000/udp (RTP - o range pode variar conforme sua configuração em rtp.conf)
# 4569/udp (IAX2)
# 5038/tcp (AMI - Asterisk Manager Interface)
# 8088/tcp (Asterisk REST Interface)
# Ajuste conforme sua necessidade e configuração (especialmente RTP)
EXPOSE 5060/udp
EXPOSE 5060/tcp
EXPOSE 5061/tcp
EXPOSE 5038/tcp
EXPOSE 4569/udp
EXPOSE 8088/tcp
# EXPOSE 10000-20000/udp

# Volumes a serem compartilhados
VOLUME ["/etc/asterisk", "/var/lib/asterisk", "/var/log/asterisk", "/var/spool/asterisk"]

# Define qual usuario vai executar o asterisk
# USER asterisk

# # Run with ENTRYPOINT
# ENTRYPOINT ["asterisk", "-f"]

# Comando padrão para iniciar o Asterisk em foreground
# Considere flags adicionais como -vvvg para mais verbosidade ou -c para console
CMD ["asterisk", "-f"]

# Opcional: Adicionar um HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
  CMD asterisk -rx "core show uptime" || exit 1