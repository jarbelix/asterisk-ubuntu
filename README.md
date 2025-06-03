# Asterisk Docker Image

Asterisk docker image preconfigurada para testes

```
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

```

Baseado em https://github.com/hectorespert/testcontainers-spring-boot-asterisk

## Instalação do FreePBX17 no Ubuntu 24.04 LTS

* https://github.com/rajannpatel/ubuntupbx
* https://ubuntu.com/blog/install-freepbx-and-asterisk-on-ubuntu-24-04-lts-for-security-patches-until-2036
* https://github.com/FreePBX/sng_freepbx_debian_install

## Running Asterisk 22 in a Docker container

* https://developernote.com/2025/01/running-asterisk-22-in-a-docker-container/

# Versões Oficiais do Asterisk

* https://docs.asterisk.org/About-the-Project/Asterisk-Versions/

## Pacotes asterisk no ubuntu

* https://packages.ubuntu.com/search?keywords=asterisk

# Links Úteis pra deploy

* Dockerfile reference - https://docs.docker.com/reference/ 
* Docker Best Practices - https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/
* CI/CD pipeline - https://github.com/marketplace/actions/docker-build-push-action

# Desenvolvimento

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

## Entrando no container (em outro terminal)
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
