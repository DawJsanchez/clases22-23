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
    web.vm.box = "apache"
  end

  config.vm.define "db" do |db|
    db.vm.box = "mysql"
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

## Provision
Ejecución de shell tras el arranque de la máquina.
---
# Voy por aquí
---

## Network

## Enlaces
+ [Geeksforgeeks](https://www.geeksforgeeks.org/what-is-vagrant/)
+ [Redes Zone](https://www.redeszone.net/tutoriales/servidores/vagrant-instalacion-configuracion-ejemplos/)
+ [Desarrollo Web](https://desarrolloweb.com/articulos/trabajar-con-vagrant.html)
