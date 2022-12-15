# graylog

Servidor de Graylog en contenedores Docker.

## Funcionamiento

```shell
make start
```

## Generar el salt y la contraseña

```shell
cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
```

```shell
echo -n "Enter Password: " && head -1 < /dev/stdin | tr -d '\n' | sha256sum | cut -d " " -f1
```

## Referencias

- [Installing Graylog > Docker](https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm)
- [Generating a random string on Linux & macOS](https://www.markusdosch.com/2022/05/generating-a-random-string-on-linux-macos/)
