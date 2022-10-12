---
 BBDD - Bases de Datos
---

# T2 DISEÑO LÓGICO DE UNA BASE DE DATOS

Fecha de examen: ¿¿??.

## NORMALIZACIÓN
> La normalización de bases de datos es un proceso que consiste en designar y aplicar una serie de reglas a las relaciones obtenidas tras el paso del modelo entidad-relación al modelo relacional con objeto de minimizar la redundancia de datos, facilitando su gestión posterior.
>
> Las bases de datos relacionales se normalizan para:
>
>    Minimizar la redundancia de los datos. \
>    Disminuir problemas de actualización de los datos en las tablas. \
>    Proteger la integridad de datos. \
>
> En el modelo relacional es frecuente llamar «tabla» a una relación; para que una tabla sea considerada como una relación tiene que cumplir con algunas restricciones:
>
>    Cada tabla debe tener su nombre único. \
>    No puede haber dos filas iguales. No se permiten los duplicados. \
>    Todos los datos en una columna deben ser del mismo tipo. \
>
> *Fuente: [Wikipedia](https://es.wikipedia.org/wiki/Normalizaci%C3%B3n_de_bases_de_datos)*

### Dependencia funcional
Es la relación entre uno o más atributos.

P.e.: El DNI de una persona tiene relación con el nombre y apellidos de la persona. Se escribiría `DNI → Nombre y apellidos`.

Otros ejemplos: la matrícula y las características de un coche, la marca de un móvil y su S.O.

**Propiedades de la dependencia funcional** \
Existen tres axiomas de Armstrong:

**Dependencia funcional reflexiva** \
Si el atributo "y" está incluido en "x" entonces `x → y` ya que a partir de cualquier atributo o conjunto de atributos siempre puede deducirse él mismo.

P.e. la provincia de inscripción en la seguridad social está incluída en el número de la suguridad, podemos por tanto deducir la provincia a partir del número de la seguridad social o el año de emisión de una factura (o ticket) está incluído en el número de factura, podemos por tanto deducir el año.

**Dependencia funcional aumentativa** \
Si `x → y` entonces `xz → yz`

P.e. si `DNI → nombre` entonces  `DNI,dirección → nombre,dirección` => Si con el DNI se determina el nombre de una persona, entonces con el DNI más la dirección también se determina el nombre y su dirección.

**Dependencia funcional transitiva.** \
Sean X, Y, Z tres atributos (o grupos de atributos) de la misma entidad. Si Y depende funcionalmente de X y Z de Y, pero X no depende funcionalmente de Y, se dice entonces que Z depende transitivamente de X.

Simbólicamente sería: `X →  Y → Z` entonces `X →  Z`

P.e. Si `FechaDeNacimiento →  Edad`, y `Edad → PuedeConducir`, entonces `FechaDeNacimiento →  Edad →  PuedeConducir`

### Pasos de la normalización:
1. Descomponer todos los grupos de datos en registros bidimensionales.
2. Eliminar todas las relaciones en la que los datos no dependan completamente de la llave primaria del registro.
3. Eliminar todas las relaciones que contengan dependencias transitivas.

![formas](https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/FormasNormalesBD.png/200px-FormasNormalesBD.png)

### Primera Forma Normal (1FN)
Se dice que una tabla se encuentra en primera forma normal si impide que un atributo de una tupla (fila) pueda tomar más de un valor.

**Ejemplo:**
Partiendo de una tabla de éste tipo:
| ID Cliente | Nombre  | Apellido | Teléfono                                  |
|------------|---------|----------|-------------------------------------------|
| 123        | Rachel  | Ingram   | 555-861-2025                              |
| 456        | James   | Wright   | 555-403-1659, 555-776-4100, 555-888-6366  |
| 789        | Cesar   | Dure     | 555-808-9633                              |

Llegaremos a la forma normal partiendo la tabla de forma que no tengamos valores repetidos:
| ID Cliente | Nombre  | Apellido  |
|------------|---------|-----------|
| 123        | Rachel  | Ingram    |
| 456        | James   | Wright    |
| 789        | Cesar   | Dure      |

Y sus teléfonos:
| ID Cliente | Teléfono      |
|------------|---------------|
| 123        | 555-861-2025  |
| 456        | 555-403-1659  |
| 456        | 555-776-4100  |
| 456        | 555-888-6366  |
| 789        | 555-808-9633  |


### Segunda Forma Normal (2FN)
Ocurre si una tabla está en primera forma normal y además cada atributo que no sea clave, depende de forma funcional completa respecto de cualquiera de las claves. Toda la clave principal debe hacer dependientes al resto de atributos, si hay atributos que depende sólo de parte de la clave, entonces esa parte de la clave y esos atributos formarán otra tabla.


**Ejemplo**
Dada la tabla: \
| DNI       | Cod Curso | Nombre | Apellido1 | Nota |
|-----------|-----------|--------|-----------|------|
| 12121219A | 34        | Pedro  | Valiente  | 9    |
| 12121219A | 25        | Pedro  | Valiente  | 8    |
| 3457775G  | 34        | Ana    | Fernández | 6    |
| 5674378J  | 25        | Sara   | Crespo    | 7    |
| 5674378J  | 34        | Sara   | Crespo    | 6    |

*Nombre y apellido* dependen de *DNI* y *Nota* depende del par *DNI*-*Cod_Curso*, por lo que tenemos nuestra partición ahí: \
| DNI       | Nombre | Apellido1 |
|-----------|--------|-----------|
| 12121219A | Pedro  | Valiente  |
| 12121219A | Pedro  | Valiente  |
| 3457775G  | Ana    | Fernández |
| 5674378J  | Sara   | Crespo    |
| 5674378J  | Sara   | Crespo    |

Y la segunda: \
| DNI       | Cod Curso | Nota |
|-----------|-----------|------|
| 12121219A | 34        | 9    |
| 12121219A | 25        | 8    |
| 3457775G  | 34        | 6    |
| 5674378J  | 25        | 7    |
| 5674378J  | 34        | 6    |

### Tercera Forma Normal (3FN)
Ocurre cuando una tabla está en 2FN y además ningún atributo que no sea clave depende transitivamente de las claves de la tabla. Es decir no ocurre cuando algún atributo depende funcionalmente de atributos que no son clave.

**Ejemplo**
Dada la tabla: \
| DNI       | Apellido1 | Nombre   | Cod Provincia | Provincia  |
|-----------|-----------|----------|---------------|------------|
| 12121349A | Velasco   | Salvador | 34            | Palencia   |
| 12121219A | Valiente  | Pedro    | 34            | Palencia   |
| 3457775G  | Fernández | Ana      | 47            | Valladolid |
| 5674378J  | Crespo    | Sara     | 47            | Valladolid |
| 3456858S  | Serrat    | Marina   | 6             | Badajoz    |

Tenemos el atributo *provincia* que pertenece a un conjunto de elementos (provincias de España), por lo que ese conjunto de atributos pasa a otra tabla con su identificador, que será el que se queda en la tabla original. \
| DNI       | Apellido1 | Nombre   | Cod Provincia |
|-----------|-----------|----------|---------------|
| 12121349A | Velasco   | Salvador | 34            |
| 12121219A | Valiente  | Pedro    | 34            |
| 3457775G  | Fernández | Ana      | 47            |
| 5674378J  | Crespo    | Sara     | 47            |
| 3456858S  | Serrat    | Marina   | 6             |

Y el conjunto de elementos pasa a la tabla: \
| Cod Provincia | Provincia  |
|---------------|------------|
| 34            | Palencia   |
| 47            | Valladolid |
| 8             | Badajoz    |

### Ejercicios normalización:
Normaliza hasta 3FN los siguentes supuestos.

**Ejercicio 1:** \
Orden (id_orden, fecha, id_cliente, nom_cliente, estado) \
ArticuloOrden (id_orden, num_art, nom_art, cant, precio)

**Ejercicio 2:** \
La empresa CASTELAR SYSTEMS lo ha contratado para crear un sistema de facturación. En la FACTURAS aparece la siguiente información:
- NUM_FAC: Número de la factura de compra venta
- FECHA_FAC: Fecha de la factura de compra venta
- NOM_CLIENTE: Nombre del cliente
- DIR_CLIENTE: Dirección del cliente
- RIF_CLIENTE: Rif del cliente
- CIUDAD_CLIENTE: Ciudad del cliente
- TELEF_CLIENTE: Teléfono del cliente
- CATEGORIA: Categoría del producto
- COD_PROD: Código del producto
- DESCRIPCION: Descripción del producto
- VAL_UNIT: Valor unitario del producto
- CANT_PROD: Cantidad de productos q compra el cliente

### Práctica:
En un antiguo videoclub se necesita mantener información de alrededor de 3000 DVDs. Cada uno de los DVD tiene asignado un número. Por cada película se necesita conocer un título y categoría por ejemplo: comedia, suspenso, drama, acción, ciencia ficción, etc. Se mantienen algunas copias de muchas películas. Se le da a cada película una identificación y se mantiene seguimiento de lo que contiene cada casete. \
Un DVD puede venir en varios formatos y una película es grabada en un solo DVD; frecuentemente las películas son pedidas de acuerdo a un actor especifico Tom Cruise y Demi More son los más populares es por esto que se debe mantener información de los actores que pertenecen a cada película. \
No en todas las películas actúan artistas famosos, a los clientes de la tienda le gusta conocer datos como el nombre real del actor, y su fecha de nacimiento. \
En la tienda se mantienen información solo de los actores que aparecen en las películas y que se tiene a disposición. Solo se alquilan videos a aquellos que pertenecen al vídeoclub. Para pertenecer al vídeoclub se debe tener un buen crédito. Por cada miembro del club se mantiene una ficha con su nombre, teléfono y dirección, cada miembro del club tiene asignado un número de socio. \
Se desea mantener información de todos los DVD que un cliente alquila, cuando un cliente alquila un DVD se debería conocer el nombre de la película, la fecha en la que se alquila y la fecha de devolución.

> Fecha de entrega: *21 octubre*
> Forma de entrega: Subir como README.md a repositorio privado en una carpeta T2-Normalización y compartir con @luiscastelar.

## Repaso:
1. Identificar **ENTIDADES** => *Hacer una lista*.
2. Sacar atributos => *Hacer un grafo*.
3. Elegir los atributos clave => ***PK***.
4. Encontrar las **relaciones** , sus *atributos* y **cardinalidades**.
5. Diseño del diagrama **ENTIDAD-RELACIÓN**.
6. Transformar a modelo **RELACIONAL**.
7. **Normalización**
> En el tema 3:
> 8. Transformar al modelo **FÍSICO**.
