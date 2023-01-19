---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T6 Docker-compose

Duración: 3 horas.

## Tutorial
Desde la página 9:
[Tutorial](https://moodle.educarex.es/iescastelarfp/pluginfile.php/46278/mod_resource/content/1/contenedores.pdf)

## Composerize
Comenzaremos con el servicio [composerize.com](https://www.composerize.com/) que nos guiará en los primeros pasos de conversión de *docker CLI* a *docker-compose*.

## Estructura de los YML
La estructura de estos ficheros es sencilla. A priori dividimos en `version` y 2 grandes secciones: `services` y `networks`. Ejemplo:
```
version: '3.3'
services:
   servicio1:
      ...
   servicio2:
      ...
   ...

networks:
   red1:
      ...
   red2:
      ...
   ...
```
*Nota:* está prohibido el uso de tabulaciones. Se debe *identar* mediante espacios.


## Práctica
Transformar la práctica anterior (`mariaDB+php-apache+phpMyAdmin` en un docker-compose funcional. \
Para aumentar la seguridad le pasaremos toda la información sensible como parámentros a  través del archivo de secretos `.env`.

Recuerda:
> Deberéis crear un conjunto de microservicios (con docker) compuesto por 3 contenedores:
> + Red interna para la comunicación entre contenedores
> + Microservicio `mariaDB` no accesible desde el mundo, sólo desde la red interna. Éste debe inicializarse con la creación del usuario `pepe`y el pass `despliegue`.
> + Microservicio `php-apache` que pueda acceder a la bbdd y desde el exterior en el puerto 80. Debe contener un `phpinfo()` en el archivo `info.php` de la raíz púbilica.
> + Microservicio `phpMyAdmin`que pueda accedar a la bbdd y sea accesible desde el exterior en el puerto 8080 o 443 si lo realizas desde un VPS. \
> *Nota: para simplificar esta última conexión deberéis pasarle la variable de entorno `PMA_HOST=nombre_contenedor_mariaDB`.*
> *Nota: El sistema debe ser accesible por cualquiera desde internet (VPS) o ser facilitado en un entorno reproducible (vagrant) con instrucciones claras para su ejecución.*

> Fecha de entrega: **7 de noviembre.**
> Forma de entrega: Subir la documentación como README.md a repositorio privado en una carpeta T6-Docker-compose y añadir el `docker-compose.yml`.
