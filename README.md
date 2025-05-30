# Asterisk Docker Image

Asterisk docker image preconfigurada para testes

Baseado em https://github.com/hectorespert/testcontainers-spring-boot-asterisk

## Instalação do FreePBX17 no Ubuntu 24.04 LTS

* https://github.com/rajannpatel/ubuntupbx

* https://ubuntu.com/blog/install-freepbx-and-asterisk-on-ubuntu-24-04-lts-for-security-patches-until-2036

## Running Asterisk 22 in a Docker container

* https://developernote.com/2025/01/running-asterisk-22-in-a-docker-container/

# Versões Oficiais do Asterisk

* https://docs.asterisk.org/About-the-Project/Asterisk-Versions/

## Pacotes asterisk no ubuntu

* https://packages.ubuntu.com/search?keywords=asterisk

# Desenvolvimento

## Build

```bash
docker build --tag jarbelix/asterisk-ubuntu --file Dockerfile .
```

## Enviando a imagem docker para hub.docker.com

```bash
docker login --username jarbelix

docker push jarbelix/asterisk-ubuntu
```

# Hub do Jarbelix

* https://hub.docker.com/u/jarbelix

# Baixando o container disponível no hub.docker.com

```bash
docker pull jarbelix/asterisk-ubuntu
```

# Executando o container

```bash
docker run --rm --name asterisk-server -p 5038:5038 -p 8088:8088 jarbelix/asterisk-ubuntu
```

# Entrando no container
```bash
docker exec -it asterisk-server /bin/bash
# htop
# tree
```

# CI/CD pipeline

* https://github.com/marketplace/actions/docker-build-push-action