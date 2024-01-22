# Graylog

Servidor de [Graylog](https://www.graylog.org) en contenedores Docker.

## Funcionamiento

1. Configurar el fichero `.env` partiendo del `env-example`.

   Para generar el `GRAYLOG_PASSWORD_SECRET`:

   ```shell
   make secret
   ```

   Y para generar el `GRAYLOG_ROOT_PASSWORD_SHA2`:

   ```shell
   make hash
   ```

2. Arrancar los contenedores:

    ```shell
    make start
    ```

3. Acceso a los servicios:

    - [Graylog](http://localhost:9000)
    - [MailCatcher](http://localhost:1080)

## Red externa

Configurar el nombre de la red en el `.env` y reiniciar los contenedores:

```shell
make clean-networks start-external-network
```

> A partir de ese momento arrancarlo siempre con `start-external-network` en vez de `start`.

## Referencias

- [Installing Graylog > Docker](https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm)
- [Generating a random string on Linux & macOS](https://www.markusdosch.com/2022/05/generating-a-random-string-on-linux-macos/)
- [Referencia del fichero server.conf](https://go2docs.graylog.org/5-0/setting_up_graylog/server.conf.html)
