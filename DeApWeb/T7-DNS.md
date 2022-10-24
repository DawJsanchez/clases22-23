---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T7 Servidor de Nombres de Dominio -DNS-

Duración: 5 horas.

## Teoría
[CIFP Rodolfo Ucha](https://wiki.cifprodolfoucha.es/index.php?title=Teor%C3%ADa_sobre_o_Servizo_de_nomes_de_dominio)

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
