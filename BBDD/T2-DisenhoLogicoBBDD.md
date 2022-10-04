---
 BBDD - Bases de Datos
---

# T2 DISEÑO LÓGICO DE UNA BASE DE DATOS

Duración: 27 horas.
{::comment}
*Fecha de examen: ??*
{:/comment}

## Modelo ENTIDAD-RELACIÓN
[Presentación](https://moodle.educarex.es/iescastelarfp/course/view.php?id=128)

### Ejercicios
#### Ejercicio 1:
Una empresa vende productos a varios clientes. Se necesita conocer los datos personales  de  los  clientes  (nombre,  apellidos,  dni,  dirección  y  fecha  de nacimiento).

Cada  producto  tiene  un  nombre  y  un  código,  así  como  un  precio  unitario.  Un cliente puede comprar varios productos a la empresa, y un mismo producto puede ser comprado por varios clientes.

Los  productos  son  suministrados  por  diferentes  proveedores.  Se  debe  tener  en  cuenta que un producto sólo puede ser suministrado por un proveedor, y que un  proveedor  puede  suministrar  diferentes  productos.  De  cada  proveedor  se  desea conocer el NIF, nombre y dirección.

[*SOLUCIÓN*](./img/T2-ejercicio1.drawio.png)

#### Ejercicio 2:
Se  desea  informatizar  la  gestión  de  una  empresa  de  transportes  que  reparte paquetes  por  toda  España.  Los  encargados  de  llevar  los  paquetes  son  los camioneros,  de  los  que  se  quiere  guardar  el  dni, nombre,  teléfono,  dirección, salario y población en la que vive.

De los paquetes transportados interesa conocer el código de paquete, descripción, destinatario  y  dirección  del  destinatario.  Un  camionero  distribuye  muchos paquetes,  y  un  paquete  sólo  puede  ser  distribuido  por  un  camionero.  De  las provincias a las que llegan los paquetes interesa guardar el código de provincia y el  nombre.  Un  paquete  sólo  puede  llegar  a  una  provincia.  Sin  embargo,  a  una provincia pueden llegar varios paquetes.

De los camiones que llevan los camioneros, interesa conocer la matrícula, modelo, tipo  y  potencia.  Un  camionero  puede  conducir  diferentes  camiones  en  fechas diferentes, y un camión puede ser conducido por varios camioneros

[*SOLUCIÓN*](./img/T2-ejercicio2.drawio.png)

#### Ejercicio 3:
Se desea diseñar la base de datos de un Instituto. En la base de datos se desea guardar  los  datos  de  los  profesores  del  Instituto  (DNI,  nombre,  dirección  y teléfono).

Los profesores  imparten  módulos,  y  cada módulo tiene  un  código  y  un  nombre. Cada alumno está matriculado en uno o varios módulos.

De cada alumno se desea guardar el nº de expediente, nombre, apellidos y fecha de  nacimiento.  Los  profesores  pueden  impartir  varios  módulos,  pero  un  módulo sólo puede ser impartido por un profesor.

Cada  curso  tiene  un  grupo  de  alumnos,  uno  de  los  cuales  es  el  delegado  del grupo.

## Práctica Modelo E-R (**pdt de revisión**)
Esta práctica la iremos resolviendo por partes encajando al final todas las piezas en el diagrama ER de la gestión educativa de un centro.
1. En nuestro centro educativo nos centramos en las personas, ya sean alumnos, profesores u otras. \
   Nos gusta conocer a todas las personas por su nombre y guardamos celosamente los datos de contacto (dirección, tlf, email y DNI). \
   Así mismo, de nuestros alumnos almacenamos el nombre y teléfono de sus padres, y de los profesores su número de la seguridad social y antigüedad en el cargo.
2. Como somos un centro moderno permitimos la matriculación parcial por módulos de nuestros alumnos. \
   Cada módulo tiene un código de curso y un número de horas.
3. Cada módulo será impartido por un profesor que será el encargado de hacer el seguimiento de faltas, retrasos y la evaluación de los progresos (nota) de cada alumno.
4. Los alumnos estararán asociados a un grupo (p.e. DAW1) que pertenece a un ciclo formativo.
5. Los grupos se componen de módulos y se imparten en aulas. Algunos módulos se imparten en grupos distintos.
6. Los módulos pertenecen a alguno de los ciclos formativos (DAW, DAM, SMR, ASIR, etc.).
7. Los grupos también pertenecen a los mismos ciclos.
7. Los módulos rellenan horario total ocupando horas completas organizadas con código L1 para lunes a primera o X4 para miércoles a cuarta.
