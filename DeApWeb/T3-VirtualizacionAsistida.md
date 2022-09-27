---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T3 Virtualización asistida (Vagrant)

Duración: 2 horas.
*Fecha de examen: ??*

## Vagrant
Es una aplicación que nos permite crear entornos de desarrollo virtuales o de contenedores, portables ya que se basan en ficheros de configuración (`Vagrantfile`) creados en Ruby.

Ejemplo sencillo de creación de 2 máquinas proporcionado por la doc Oficial:
```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "web" do |web|
    web.vm.box = "techchad2022/ubuntu2204"
  end

  config.vm.define "db" do |db|
    db.vm.box = "techchad2022/ubuntu2204"
  end
end
```

Al estar escrito en Ruby nos permite utilizar toda la potencia del lenguaje:
```
Vagrant.configure("2") do |config|
  config.vm.define "vm-servidor" do |servidor|
    servidor.vm.box = "debian/buster64"
    servidor.vm.network "private_network", ip: "192.168.10.10"
    servidor.vm.provision "shell", path: "provision-servidor.sh"
  end

  for i in 1..2
    config.vm.define "vm-cliente-#{i}" do |cliente|
      cliente.vm.box = "debian/buster64"
      cliente.vm.network "private_network", ip: "192.168.10.#{10+i}"
      cliente.vm.provision "shell", path: "provision-clientes.sh", args: [ i.to_s ]
    end
  end
end
```
> En este ejemplo creamos un servidor y 2 clientes conectados por una red interna

Esos *snipet* volcados contra un archivo denominado *Vagrantfile* permitirán portar dicha configuración a cualquier otro host independientemente del hardware y sistema operativo que ejecute. Sólo requerirá tener instalado *Vagrant* y el proveedor de vm, en nuestro caso disponible para *virtualBox* y *libvirt*.

## Vagrant box
[Vagrant box](https://app.vagrantup.com/boxes/search)

## Manejo de máquinas
En un directorio donde tengamos un *Vagrantfile*:
+ vagrant up -> la crea
+ vagrant ssh -> accede a ella por ssh
+ vagrant suspend -> la pone en suspensión
+ vagrant halt -> la detiene
+ vagrant destroy -> la destruye

## Archivo Vagrantfile
+ [Doc **OFICIAL**](https://www.vagrantup.com/docs/vagrantfile)
+ [Tutorial - devopscube.com](https://devopscube.com/vagrant-tutorial-beginners/)

## Provisioning
Provisioners ("suministro") nos permite instalar software, modificar configuraciones o añadir archivos a las máquinas en el proceso de la puesta en marcha `vagrant up`.
+ Mensajes: `config.vm.provision "shell", inline: "echo Hola, soy tu máquina virtual"`
+ Shell:
```
$script = <<-SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: $script
end
```
+ Archivos: `config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"`
+ Scripts: `config.vm.provision "shell", path: "script.sh"` o `config.vm.provision "shell", path: "https://example.com/provisioner.sh"`

## Network
Configuración de redes de las VM.
+ Port Forwarding (Reenvío de puertos): Con esta acción, mal llamada comúnmente *abrir puertos*, vagrant conectará puertos de nuestro *HOST* al máquina virtual seleccionada. \
  `config.vm.network "forwarded_port", guest: 80, host: 8080`
+ Hostname: `config.vm.hostname = "myhost.local"`
+ Red privada (NAT):
  - Estática: `config.vm.network "private_network", ip: "192.168.50.4"`
  - Dinámica: `config.vm.network "private_network", type: "dhcp"`
  - IPv6: `config.vm.network "private_network", ip: "fde4:8dba:82e1::c4", netmask: "96"`
+ Red pública (Bridge):
  - Dinámia: `config.vm.network "public_network"`
  - Estática: `config.vm.network "public_network", ip: "192.168.0.17"`
  - Selección de interfaz: `config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"`
> Nota: En la modalidad de red pública la máquina podrá tener una IP en la misma red que el *HOST* o no, pero tendrá conexión directa al "cable" de salida.
## Compartiendo datos con el *HOST*
Conecta directorios del *HOST* con directorios de las *VM*
`config.vm.synced_folder "src/", "/srv/website"`

## ERRORES
+ Compartir directorios: \
> Vagrant was unable to mount VirtualBox shared folders. This is usually \
> because the filesystem "vboxsf" is not available. This filesystem is \
> made available via the VirtualBox Guest Additions and kernel module. \
> Please verify that these guest additions are properly installed in the \
> guest. This is not a bug in Vagrant and is usually caused by a faulty \
> Vagrant box. For context, the command attempted was:
>
> mount -t vboxsf -o uid=1000,gid=1000,_netdev compartida /compartida
>
> The error output from the command was:
>
> : No such device

+ Activar red pública: \
  Bajo Windows, en ocasiones puede suceder que no nos aparezca ninguna interfaz para utilizar como interfaz de red en modo público (bridge). Esto es a menudo un bug de *virtualBox* por lo que deberemos verificar si en él si es posible crear una interfaz en modo puente, y si no es así, deberemos desinstalar y volver a instalar *virtualBox*.

## PRÁCTICA:
Diseña e implementa un entorno portable consistente en 2 máquinas virtuales con las siguientes premisas:
+ Servidor: Debe tener doble red (pública y privada).
  - Red pública: será capaz de hacer ping al *HOST* del profesor (la IP se dirá en clase).
  - Red privada: será capaz de hacer ping a la otra VM.
+ Cliente:
  - Enviará un saludo por la consola.
  - Se instalará rclone
  - Se configurará la zona horaria a Europe/Lisbon

*Nota*: \
 Para cambiar la zona horaria: `timedatectl set-timezone Europe/Linbon` \
 Para mostar la hora: `timedatectl`

> Fecha de entrega: 18 de octubre. \
> Forma de entrega: Sibir como README.md a repositorio privado en una carpeta T3-Vagrant y compartir con @luiscastelar.

## Enlaces
+ [Geeksforgeeks](https://www.geeksforgeeks.org/what-is-vagrant/)
+ [Redes Zone](https://www.redeszone.net/tutoriales/servidores/vagrant-instalacion-configuracion-ejemplos/)
+ [Desarrollo Web](https://desarrolloweb.com/articulos/trabajar-con-vagrant.html)

---
Fin de tema.
