# Graylog

Servidor de [Graylog](https://www.graylog.org) en contenedores Docker.

## Funcionamiento

```shell
make start
```

## Generar el salt y la contraseña

Para configurar los valores en el `.env`.

```shell
cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
```

```shell
echo -n "Enter Password: " && head -1 < /dev/stdin | tr -d '\n' | sha256sum | cut -d " " -f1
```

## Red externa

Configurar el nombre de la red en el `.env` y borrar los contenedores y la red `graylog_default`:

```shell
make clean-containers-networks start-external-network
```

> A partir de ese momento arrancarlo siempre con `start-external-network` en vez de `start`.

## Referencias

- [Installing Graylog > Docker](https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm)
- [Generating a random string on Linux & macOS](https://www.markusdosch.com/2022/05/generating-a-random-string-on-linux-macos/)
