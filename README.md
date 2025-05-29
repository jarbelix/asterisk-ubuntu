# Asterisk Docker Image

Asterisk docker image preconfigurada para testes

Baseado em [testcontainers-spring-boot-asterisk](https://github.com/hectorespert/testcontainers-spring-boot-asterisk)

## Versões do Asterisk

* https://docs.asterisk.org/About-the-Project/Asterisk-Versions/

## Desenvolvimento

### Build

```bash
docker build . --file Dockerfile --tag jarbelix/asterisk --progress=plain
```

### Run

```bash
docker run -it --rm -p 5038:5038 -p 8088:8088 jarbelix/asterisk
```