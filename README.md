Imagen docker que ejecuta un servicio postfix. Puerto de escucha 25. Sin autenticación.

Crea la imagen:

```
1docker_build.bat
```

Inicia el contenedor:

```
2docker_run.bat
```

Esto abrirá un puerto 25/tcp en localhost. Si envía un correo por smtp a este puerto, se estará enviando al servicio postfix del contenedor y se enviará el correo.
