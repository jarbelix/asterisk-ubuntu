# Asterisk Docker Image

```

                              __   _,--="=--,_   __
                             /  \."    .-.    "./  \
                            /  ,/  _   : :   _  \/` \
                            \  `| /o\  :_:  /o\ |\__/
                             `-'| :="~` _ `~"=: |
                                \`     (_)     `/ jgs
                         .-"-.   \      |      /   .-"-.
.-----------------------{     }--|  /,.-'-.,\  |--{     }----------------------.
 )                      (_)_)_)  \_/`~-===-~`\_/  (_(_(_)                     (
(                                                                              )
 )                    Asterisk Preconfigurado para Testes                     (
(                                  Ubuntu LTS                                  )
 )                                                                            (
'------------------------------------------------------------------------------'

```
# Orquestrando com o docker-compose.yml
```bash
# Clonar o repositório
git clone https://github.com/jarbelix/asterisk-ubuntu.git
cd asterisk-ubuntu

# Rodando os containers
docker compose up -d

# Verificando os logs
docker compose logs -f

# Parando os containers
docker compose down

# Verificando os volumes
docker volume ls

# Removendo os volumes
docker volume rm asterisk-ubuntu_asterisk_config asterisk-ubuntu_mysql_data

```
## Entrando no asterisk-server (em outro terminal)
```
docker exec -it asterisk-ubuntu-asterisk-server-1 /bin/bash
  _____________________________________________________________________________
/\                                                                            \
\_|     _        _            _     _      _   _ _                 _          |
  |    / \   ___| |_ ___ _ __(_)___| | __ | | | | |__  _   _ _ __ | |_ _   _  |
  |   / _ \ / __| __/ _ \ '__| / __| |/ / | | | | '_ \| | | | '_ \| __| | | | |
  |  / ___ \\__ \ ||  __/ |  | \__ \   <  | |_| | |_) | |_| | | | | |_| |_| | |
  | /_/   \_\___/\__\___|_|  |_|___/_|\_\  \___/|_.__/ \__,_|_| |_|\__|\__,_| |
  |                                                                           |
  |   ________________________________________________________________________|_
   \_/__________________________________________________________________________/

┌─[root@a8e99d8e9be7]─[/etc/asterisk]─[Mon Jun 02 19:30:27 UTC]
└──╼ # meuip
{
  "ip": "179.151.8.153",
  "hostname": "179-151-8-153.user.vivozap.com.br",
  "city": "Rondonópolis",
  "region": "Mato Grosso",
  "country": "BR",
  "loc": "-16.4708,-54.6356",
  "org": "AS26599 TELEFÔNICA BRASIL S.A",
  "postal": "78700-000",
  "timezone": "America/Cuiaba",
  "readme": "https://ipinfo.io/missingauth"
}
┌─[root@a8e99d8e9be7]─[/etc/asterisk]─[Mon Jun 02 19:30:30 UTC]
└──╼ # asterisk -rv
Asterisk 20.6.0~dfsg+~cs6.13.40431414-2build5, Copyright (C) 1999 - 2022, Sangoma Technologies Corporation and others.
Created by Mark Spencer <markster@digium.com>
Asterisk comes with ABSOLUTELY NO WARRANTY; type 'core show warranty' for details.
This is free software, with components licensed under the GNU General Public
License version 2 and other licenses; you are welcome to redistribute it under
certain conditions. Type 'core show license' for details.
=========================================================================
Connected to Asterisk 20.6.0~dfsg+~cs6.13.40431414-2build5 currently running on a8e99d8e9be7 (pid = 1)
Unable to read or write history file '/root/.asterisk_history'
a8e99d8e9be7*CLI> quit
Asterisk cleanly ending (0).
Executing last minute cleanups
┌─[root@a8e99d8e9be7]─[/etc/asterisk]─[Mon Jun 02 19:30:36 UTC]
└──╼ #
```
## Entrando no mysql-server ( é um Oracle Linux Server e eu não sabia)

```
docker exec -it asterisk-ubuntu-mysql-server-1 /bin/bash
bash-5.1# cat /etc/os-release 
NAME="Oracle Linux Server"
VERSION="9.6"
ID="ol"
ID_LIKE="fedora"
VARIANT="Server"
VARIANT_ID="server"
VERSION_ID="9.6"
PLATFORM_ID="platform:el9"
PRETTY_NAME="Oracle Linux Server 9.6"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:oracle:linux:9:6:server"
HOME_URL="https://linux.oracle.com/"
BUG_REPORT_URL="https://github.com/oracle/oracle-linux"

ORACLE_BUGZILLA_PRODUCT="Oracle Linux 9"
ORACLE_BUGZILLA_PRODUCT_VERSION=9.6
ORACLE_SUPPORT_PRODUCT="Oracle Linux"
ORACLE_SUPPORT_PRODUCT_VERSION=9.6
bash-5.1# 
```

# Documentos relacinados ao Asterisk
* Versões Oficiais do Asterisk - https://docs.asterisk.org/About-the-Project/Asterisk-Versions/
* Pacotes asterisk no Ubuntu - https://packages.ubuntu.com/search?keywords=asterisk
* Glossario - https://www.asterisk.org/get-started/glossary/
* Guia Definitivo - http://www.asteriskdocs.org/
* Getting Started with ARI - https://docs.asterisk.org/Configuration/Interfaces/Asterisk-REST-Interface-ARI/Getting-Started-with-ARI/
* Monitoring Asterisk telephony system with Zabbix via Http - https://github.com/Omid-Mohajerani/VoIP-Monitoring/wiki/Monitoring-Asterisk-telephony-system-with-Zabbix-via-Http#step-3---asterisk-configuration
* Integração Zabbix/Asterisk - https://www.youtube.com/watch?v=hSjJkSsYvAA&ab_channel=AlexandreCastro
  * https://github.com/alexandremjcastro/Zabbix
  * https://github.com/theguimaraes/zabbix

# Instalação do FreePBX17 no Ubuntu 24.04 LTS

* https://github.com/rajannpatel/ubuntupbx
* https://ubuntu.com/blog/install-freepbx-and-asterisk-on-ubuntu-24-04-lts-for-security-patches-until-2036

* FreePBX - https://github.com/FreePBX
* Script de instalação - https://github.com/FreePBX/sng_freepbx_debian_install

# Desenvolvimento

Baseado em https://github.com/hectorespert/testcontainers-spring-boot-asterisk

## Links Úteis pra deploy

* Dockerfile reference - https://docs.docker.com/reference/dockerfile/
* Docker Best Pratices - https://docs.docker.com/build/building/best-practices/
* Choosing RUN, CMD and ENTRYPOINT - https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/
* CI/CD pipeline - https://github.com/marketplace/actions/docker-build-push-action

## Running Asterisk 22 in a Docker container

* https://developernote.com/2025/01/running-asterisk-22-in-a-docker-container/

## Build manual

```bash
docker build --no-cache --tag jarbelix/asterisk-ubuntu --file Dockerfile .
```

## Enviando a imagem docker para hub.docker.com

```bash
docker login --username jarbelix

docker push jarbelix/asterisk-ubuntu
```

## Hub do Jarbelix

* https://hub.docker.com/u/jarbelix

## Baixando o container disponível no hub.docker.com

```bash
docker pull jarbelix/asterisk-ubuntu
```

## Executando o container

```bash
docker run --rm --name asterisk-server jarbelix/asterisk-ubuntu
```

