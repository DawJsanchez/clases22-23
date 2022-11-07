---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T7 Servidor de Nombres de Dominio -DNS-

Duración: 5 horas.

## Teoría
1. Textos planos `/etc/hosts`
2. Sistema gerárquico
	[TopLevelDomains](./img/T7-tld.jpg)
	Organización de servidores:
	+ partiendo de los servidores `root`que son los `.` (dot)
	+ posteriormente tenemos los Top Level Domains -tld- que tenemos de 2 tipos: geográficos (`.es.`., `.fr.`, `.pt.`, ...) y específicos (`.com.`, `.org.`, `.tv.`, ...).
	+ después tenemos los de segundo nivel, los denominados dominios, p.e. `google.es.`, `duckdns.org.`
	+ los subdominios, p.e. `luiscastelar.duckdns.org.` o `mail.google.com.`.
	+ límites:
		* Cada nodo del árbol se llama nombre de dominio y tiene una etiqueta con una longitud máxima de 63 caracteres.
		* La profundidad máxima de una estructura arbórea es 127 niveles y la longitud máxima para un nombre es de 255 caracteres (incluído el punto final **obligatorio**).
	    * El nombre absoluto de un equipo -FQDN- está relacionado con todas las etiquetas de nodo y que termina con un punto final (`root`)
3. Mecanismo de funcionamiento:
	[DNS Iterativo](./img/T7-dns-iterativo.png)

*Nota*: Existe otro mecanismo denominado DNS recursivo.


*Bibliografía*: [CIFP Rodolfo Ucha](https://wiki.cifprodolfoucha.es/index.php?title=Teor%C3%ADa_sobre_o_Servizo_de_nomes_de_dominio)

## Cliente DNS:
Jerarquía de resolución:
1. Archivo `/etc/hosts`: \
Fichero para la resolución estática de nombres (normalmente de la red local).

Incluye nuevas líneas en este fichero para la resolución de nombres de la red local. Las líneas de /etc/hosts tienen el formato:
>
> \# dirección_IP nombre_largo nombre_corto \
> 127.0.0.1 localhost.localdomain localhost \
> 192.168.45.123 sauron.mordor.com sauron \
> \# bannear a youtuble \
> 127.0.0.2 youtuble.com \
>
Comprueba su funcionamiento haciendo ping a las máquinas que has incluido.

*Nota*: en Windows el archivo es `C:\Windows\System32\drivers\etc\hosts`.

*Nota 2*: Firefox no respeta el uso de este archivo.


2. Servicio DNS indicado en `/etc/resolv.conf`
Fichero que especifica los servidores DNS y los dominios de búsqueda... salvo que en las nuevas versiones de S.O.s basados en Gnu/Linux ya no podemos editarlo directamente. El archivo es controlado por *systemd*.

Ahora:
1. Modificar archivo `/etc/system/resolved.conf`
2. Enlazar el sistema *antiguo* `sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf`
3. Reiniciar servicio:
   + `sudo systemctl stop systemd-resolved`
   + `sudo systemctl start systemd-resolved`

> Nota: En cierta bibliografía aparecerá como `sudo systemctl stop systemd-resolved.service`. Deberéis saber que systemd toma por defecto *.service* si se omite el tipo de *demonio* (service, socket, ...)


### Referencias webgráficas
+ [ngi.es](https://www.ngi.es/configurar-servidor-dns-con-dnsmasq/)
+ [Jose Domingo Muñoz](https://www.josedomingo.org/pledin/2020/12/servidor-dns-dnsmasq/)
+ [DNS contra contenedores docker](https://dev.to/karlredman/dnsmasq--networkmanager--private-network-setup-258l)

## Práctica1
Montar un servidor de DNS que resuelva las IPs de 1 compañero, la del profesor y un registro MX.  \
Pasos:
1. Tener una máquina Vagrant con IP pública y estática, y `docker`.
2.  Instalar y configurar como microservicio el servidor `dnsmasq` de forma que resuelva lo solicitado.

*Nota: los ficheros de configuración de `dnsmasq` se encuentran en `/etc/dnsmasq.conf`*


## Práctica 2: Balanceo de caga DNS usando los registros NS
Sigue las instrucciones para realizar un balanceo básico con un servidor DNS.
[Jose Domingo Muñoz](https://www.josedomingo.org/pledin/2022/02/dns-balanceo-carga/)

*Nota: Requieres 3 contenedores (2 nginx y un dnsmasq) y una red.*

> Fecha de entregas: **14 de noviembre.**
> Forma de entrega: Subir la documentación como README.md a repositorio privado en una carpeta T7-DNS y añadir el `docker-compose.yml` de cada práctica y los ficheros de configuración necesarios.
