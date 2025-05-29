# Asterisk Docker Image

Asterisk docker image preconfigurada para testes

Baseado em https://github.com/hectorespert/testcontainers-spring-boot-asterisk

Instalação do FreePBX17 no Ubuntu 24.04 LTS

* https://github.com/rajannpatel/ubuntupbx

## Versões Oficiais do Asterisk

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
docker login jarbelix

docker push jarbelix/asterisk-ubuntu
```

# Baixando o container disponível no hub.docker.com

```bash
docker pull jarbelix/asterisk-ubuntu
```

# Executando o container

```bash
docker run --rm -it --name asterisk -p 5038:5038 -p 8088:8088 jarbelix/asterisk-ubuntu /bin/bash
# htop
# tree
```
