---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T3 Virtualización asistida (Vagrant)

Duración: 2 horas.
Fecha de examen: **18 oct**

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

> Nota: el `provisioning` se produce en el momento de creación de la máquina, por lo que si queremos alterar algo `shell` o `file` deberemos utilizar el comando `vagrant provision` o `vagrant up --provision` en caso de estar detenida la VM.
>
> Nota2: el `provisioning` de archivos se realiza por `scp` por el usuario por defecto, por lo que si tenemos que ubicarlo en un directorio privilegiado deberemos realizarlo en 2 pasos: subir a un temporar y moverlo por `shell` con privilegios. P.e.:
```
config.vm.provision "file", source: "./sshd_config", destination: "sshd_config"
config.vm.provision "shell" do |s|
  s.inline = "mv sshd_config /etc/ssh/"
  s.privileged = true
end
```


### Ejemplo completo:
Ejemplo de ejecución de script tras el arrenque de la VM:
```
Vagrant.configure("2") do |config|
  ...
  config.vm.provision :shell, path: "bootstrap.sh"
  ...
end
```

El archivo *bootstrap.sh* deberá ubicarse en el mismo directorio que tu *Vagrantfile* y podría contener por ejemplo la carga de un ***cron***:
```
#!/bin/bash
# Adds a crontab entry to curl google.com every hour on the 5th minute

# Cron expression
cron="5 * * * * curl http://www.google.com"
    # │ │ │ │ │
    # │ │ │ │ │
    # │ │ │ │ └───── day of week (0 - 6) (0 to 6 are Sunday to Saturday, or use names; 7 is Sunday, the same as 0)
    # │ │ │ └────────── month (1 - 12)
    # │ │ └─────────────── day of month (1 - 31)
    # │ └──────────────────── hour (0 - 23)
    # └───────────────────────── min (0 - 59)

# Escape all the asterisks so we can grep for it
cron_escaped=$(echo "$cron" | sed s/\*/\\\\*/g)

# Check if cron job already in crontab
crontab -l | grep "${cron_escaped}"
if [[ $? -eq 0 ]] ;
  then
    echo "Crontab already exists. Exiting..."
    exit
  else
    # Write out current crontab into temp file
    crontab -l > mycron
    # Append new cron into cron file
    echo "$cron" >> mycron
    # Install new cron file
    crontab mycron
    # Remove temp file
    rm mycron
fi
```

**Nota:** Recuerda que por defecto los *provisioners* son ejecutados por el **root** del sistema. Si no es lo que deseas, deberás indicarlo con `config.vm.provision :shell, path: "bootstrap.sh", privileged: false`.

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
