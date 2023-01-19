---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T4 SSH: Cliente, servidor y bastionado

Duración: 3 horas.


## Clientes
+ En GNU/Linux: viene de "serie" `openssh`. Ejecución:
  - `ssh [USUARIO]@HOST [-p PUERTO]` -> Tunel SSH normal.
  - `ssh [USUARIO]@HOST [-ND PROXY_SOCKS]` -> Proxy SOCKS
  - `ssh [USUARIO]@HOST [-R PUERTO:SOCKET]` -> tunel inverso.
  - `ssh [USUARIO]@HOST [COMANDO_REMOTO]`-> Ejecuta el comando remoto y nos devuelve el resultado de salida `standard` remota en la salida `standard` local.

  La configuración de usuario se guarda en `~/.ssh/` (config, host conocidos, llaves y host autorizados). \
  La configuración del cliente se guarda en `/etc/ssh/ssh_config`

+ En Windows: normalmente con `puTTY`, pero si tienes `git` te instala `minTTY`, aunque con `PowerShell`viene integrado un cliente. \
  **Importente**: Recuerda que la separación de rutas en windows es '\\', pero en entornos UN*X es '/', y que las unidades están bajo el paraguas de la raíz (`/`).

## Servidores:
+ En GNU/Linux: se instala `openssh-server`. En entornos `systemd` se controla con `sudo systemctl COMANDO sshd`. \
  La configuración se almacena en `/etc/ssh/sshd_config`, con la 'd' final de `daemon` que es sinónimo de **servicio**.
+ En Windows: Windows Server 2019 es instalable y puede controlarse remotamente gracias a ello.

## Bastionado:
### Fail2ban
+ [Doc OFICIAL](https://www.fail2ban.org/wiki/index.php/MANUAL_0_8#Introduction)
+ [Guía completa](http://albertomagallon.es/fail2ban-bastionado-de-servicios-remotos-en-linux/)
+ [Guía](https://www.ionos.es/digitalguide/servidores/seguridad/fail2ban-la-herramienta-ideal-para-proteger-tu-servidor/)

### Port-knoking
+ [Guía](https://www.tecmint.com/port-knocking-to-secure-ssh/)
+ [Guía esp](https://rm-rf.es/port-knocking-en-debian-con-knockd/)


## Práctica
Montaremos un entorno de desarrollo (`Vagrant`) con soporte `ssh server` bastionado con `fail2ban` y `knockd`.
1. Crearemos un primer Vagrant con Ubuntu Server 20.04 de "gusztavvargadr/ubuntu-server". Con él vamos a montar una servidor con una ip pública, instalaremos `fail2ban` y `knockd` y pondremos una copia de los ficheros de configuración que necesitamos modificar (`sshd_config`, `knockd.conf` y `knockd`).
2. Realizaremos los cambios y sobreescribiremos los ficheros originales con un `provisioning`.
3. Probamoos a entrar hasta que nos banee. Guardar captura de `/var/log/fail2ban.log`.
4. Probaremos el sistema de port-knocking y guardaremos capturas. \
Por supuesto todos los ficheros estarán en un directorio de vuestro git.

### [Opcional] **EXTRA**: Configura Fail2ban para remitir avisos por [Telegram](https://github.com/shafiqsaaidin/fail2ban-telegram-notification)

> Fecha de entrega: **24 de octubre.**
> Forma de entrega: Subir como README.md a repositorio privado en una carpeta T4-SSH y compartir con @luiscastelar.
---
Fin de tema.
