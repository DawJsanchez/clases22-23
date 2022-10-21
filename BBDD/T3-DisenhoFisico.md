---
 BBDD - Bases de Datos
---

# T3 Diseño físico

Duración: 21 horas. \
Temporización: 20/10 - 15/11

## Lenguaje de consultas estructuradas -SQL-
Es un lenguaje estandar estructurado diseñado para administrar y recuperar información de SGBD. La versión más actual es la ANSI SQL:2016.

Desgraciadamente, cada fabricante ha desarrollado su propio dialecto para que el usuarrio pueda extender sus funcinalidades con procedimientos y funciones. \
Nosotros utilizaremos MariaDB en su rama 10.X. La misma fue compatible plenamente con MySQL hasta la versión 5.5 en la que ambos desarrollos separaron caminos.

Se divide en 3 partes:
+ LDD (lenguaje de definición de datos): Incluye sentencias para gestionar las estructuras, esto es, la creación y modificación de tablas.
+ LMD (lenguaje de manipulación de datos): Incluye sentencias para gestionar los datos.  \
    LMD por tanto se encargará de realizar los CRUD:
	- C de Create: insertará nuevos registros.
	- R de Read: consultará los datos de las tablas.
	- U de Update: actualizará total o parcialmente los registros.
	- D de Delete: eliminará los registros.
+ LCD (lenjuage de control de datos): Incluye sentencias para gestionar la seguridad y los permisos.  \
    Creción de usuarios, roles y asignación granular de permisos de lectura/escritura a vistas, tablas o bases de datos.

## Cómo documentarnos sobre SQL
Pues el mejor sitio para documentarnos es sin duda la [documentación OFICIAL](https://mariadb.com/kb/en/sql-statements-structure/).

Lo que ocurre es que si deseamos saber como crear una tabla, de nuestro modelo RELACIONAL ya normalizado en 3FN, nos encontraremos cosas como ésta:
```
CREATE [OR REPLACE] [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    (create_definition,...) [table_options    ]... [partition_options]
CREATE [OR REPLACE] [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    [(create_definition,...)] [table_options   ]... [partition_options]
    select_statement
CREATE [OR REPLACE] [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
   { LIKE old_table_name | (LIKE old_table_name) }

select_statement:
    [IGNORE | REPLACE] [AS] SELECT ...   (Some legal select statement)
```
E indagando vemos que nos añade que *create_definition* será:
```
create_definition:
  { col_name column_definition | index_definition | period_definition | CHECK (expr) }

column_definition:
  data_type
    [NOT NULL | NULL] [DEFAULT default_value | (expression)]
    [ON UPDATE [NOW | CURRENT_TIMESTAMP] [(precision)]]
    [AUTO_INCREMENT] [ZEROFILL] [UNIQUE [KEY] | [PRIMARY] KEY]
    [INVISIBLE] [{WITH|WITHOUT} SYSTEM VERSIONING]
    [COMMENT 'string'] [REF_SYSTEM_ID = value]
    [reference_definition]
  | data_type [GENERATED ALWAYS]
  AS { { ROW {START|END} } | { (expression) [VIRTUAL | PERSISTENT | STORED] } }
      [UNIQUE [KEY]] [COMMENT 'string']

constraint_definition:
   CONSTRAINT [constraint_name] CHECK (expression)
```

Deberemos saber por tanto que tenemos las siguientes reglas:
| Símbolo     | Descripción                                                                                                                                                                                        |
|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mayúsculas  | Una palabra en mayúsculas refleja una palabra reservada de SQL y por tanto hay que escribirla tal y como aparece en la sintaxis.                                                                   |
| Minúsculas  | Una palabra en minúsculas es algo variable y hay que sustituirla por un dato concreto.                                                                                                             |
| [ ]         | Los corchetes se utilizan para reflejar que las alternativas que contienen son opcionales. Por tanto toda palabra no encerrada entre corchetes debe ser incluida obligatoriamente en la sentencia. |
| \|          | La barra vertical sirve para separar opciones alternativas en una lista. Solo se puede usar una de ellas.                                                                                          |
| [ \| ]      | Cuando una lista separada con barras se encierra entre corchetes indica que se puede elegir entre estos valores opcionalmente.                                                                     |
| { }         | Si una lista se encierra entre llaves, igual que pasa con los corchetes, indica que sus valores se pueden elegir, pero es necesario elegir uno de ellos.                                           |
| …           | Varias palabras separadas por comas y finalizadas con puntos suspensivos significan que se puede usar un número variable de esos datos y siempre separados con comas.                              |

Una vez conocidas estas reglas podemos pasar a crear nuestras primeras tablas.

P.e., la creación de la tabla correspondiente a la entidad *CICLISTA* del ejercicio del examen del tema anterior se concretaría:
```
/* -----------------------------------------------------------------------------
 * Esta sentencia crea la tabla *ciclista*.
 * Campos:
 *	- numFederado (entero, no nulo, autoincremental)
 *	- nombre (cadena de máx 20 caracteres)
 *	- idNacionalidad (entero) /Más adelante lo enlazaremos (FK) con su tabla
 *	- fechaNacimiento (fecha) / Formato similar a string del tipo 'AAAA-MM-DD'
 *	- Convertimos numFederado a PK
 *----------------------------------------------------------------------------*/
CREATE TABLE ciclista (numFederado INT NOT NULL AUTO_INCREMENT,
			nombre VARCHAR(20),
			nacionalidad VARCHAR(20),
			fechaNacimiento DATE,
			PRIMARY KEY(numFederado)
			);
```

Como podemos ver, podemos añadir comentarios en/entre sentencias SQL con el formato tipo *C* o *Java* `/*`y `*/`.  \
También podremos hacerlo mediante un comentario de una sola línea predediendolo de `#` o con el desaconsejado `-- ` (lleva 2 giones y un espacio).

En `MariaDB` y `MySQL` tenemos además los comentarios ejecutables `/*! codigo a ejcutar */`. Aunque no son objeto de este curso, los veremos en las exportaciones/importaciones de database -en adelante db- y tablas.  \
*Si el alumno desea ampliar, puede hacerlo en la documentación oficial*.

## LDD - Creación/Uso/Eliminación de bases de datos:
El conjunto de todas las tablas y otras características avanzadas (triggers, vistas, rutinas, comentarios de tablas y eventos) se denomina `DATABASE` (base de datos). \
Un sistema gestor de db como `MariaDB` puede albergar múltiples db, cada una con todo el contenido indicado en el párrafo anterior + el conjunto de permisos de acceso/escritura que veremos en la sección de LCD.

Para crear una db: `CREATE DATABASE nombreBaseDeDatos`

Para eliminarla: `DROP DATABASE nombreBaseDeDatos;`

Para usarla: `USE nombreBaseDeDatos`

## LDD - Creación de tablas:
Ver ejemplo en apartado de documentación.

### Palabras reservadas en SQL
[Ver doc oficial](https://dev.mysql.com/doc/refman/8.0/en/keywords.html)

Al contrario que en otros lenguajes, en SQL podremos utilizar las palabras reservadas siempre que indiquemos que son una cita (quote), esto es, añadir la palabra entre dos " \`  ". P.e.:  <code>SELECT \`fulltex\` FROM tabla</code>

### Tipos de datos
+ Textos: CHAR(n), VARCHAR(n), TEXT(n), BLOB(n), LONGTEXT, LONGBLOB, ENUN(val1, val2,...), ...
+ Números: BOOL, INT(n), FLOAT(p)
+ Fecha:
	- DATE: 'AAAA-MM-DD' (Ojo: el rango es de '1000-01-01' a '9999-12-31')
	- DATETIME: 'AAAA-MM-DD hh:mm:ss' (Ojo: mismo rango)
	- *TIMESTAMP*: El tiempo en UNIX -EPOCH- se mide como la cantidad de segundos transcurridos desde las 0h00m00s del 1 de enero de 1970 UTC (tiempo universal coordinado), y es un real con signo, por lo que pude medir instantes anteriores indicando los segundos hasta dicho momento.
     La parte decimal indica fracciones de segundo, esto es, el TIMESTAMP 60.1 corresponde a las 0 horas 01 minutos 00 segundos y una décima, del 1 de enero de 1970 UTC.
     - TIME: 'hh:mm:ss' (Ojo: que mide desde 839 horas a -839 horas).
	 - YEAR: 'AAAA' (Ojo: Entre 1901 y 2155 y 0000).
  + [Más tipos](https://mariadb.com/kb/en/data-types/)

### Literales
Similar a `Java`, encerrando los valores de texto entre comillas simples, p.e.  `SELECT * FROM tabla WHERE nombre = 'Pepe'`

Como en `Java` deberemos escapar ciertos caracteres:
| Escape sequence | Character                                           |
|-----------------|-----------------------------------------------------|
| \0              | ASCII NUL (0x00).                                   |
| \'              | Single quote (“'”).                                 |
| \"              | Double quote (“"”).                                 |
| \b              | Backspace.                                          |
| \n              | Newline, or linefeed,.                              |
| \r              | Carriage return.                                    |
| \t              | Tab.                                                |
| \Z              | ASCII 26 (Control+Z). See note following the table. |
| \\              | Backslash (“\”).                                    |
| \%              | “%” character. See note following the table.        |
| \_              | A “_” character. See note following the table.      |

### Ejercicio:
Crea el resto de tablas del ejercicio propuesto de examen Modelo ER y RELACIONAL.

## LDD - Modificación de tablas:
`ALTER TABLE` será la sentencia a utilizar para modificar una tabla que ya existe.

Ejemplos:
```
# Añadir el campo apellido:
ALTER TABLE ciclista
	ADD apellidos VARCHAR(20);

# Eliminar el campo equipo:
ALTER TABLE ciclista
	DROP COLUMN equipo;

# Modificar la nacionalidad para normalizar la tabla
ALTER TABLE ciclista
	MODIFY COLUMN nacionalidad INT;

# Añadir la nacionalidad como FK (primero eliminamos la columna actual)
# Después deberemos añadir una columna con la FK y que haga referencia a la tabla(atributo)
ALTER TABLE ciclista DROP COLUMN nacionalidad;
ALTER TABLE ciclista
	ADD FOREIGN KEY (idNacionalidad) REFERENCES nacionalidad(id);

# Eliminar un FK
ALTER TABLE ciclista
	DROP FOREIGN KEY idNacionalidad;

```

### Ejercicio
Crea las modificaciones necesarias para crear las FK vinculantes.

## LDD - Creación/Eliminación de DB, index, tablas y vistas:

## Atomic DDL
Desde MariaDB 10.6.1, existen algunas operaciones son realizadas de forma atómica y proporcionan seguridad de ser serguras ante *crash* (desastres).

Si por tanto se produce una caída del servidor de db en mitad de una de estas operaciones existe la posibilidad de regresión al estado anterior. Ésta posibilidad es fundamental en ciertos entornos críticos, p.e. funcionamiento de la bolsa de Madrid o un banco.


we have improved readability for DDL (Data Definition Language) operations to make most of them atomic, and the rest crash-safe, even if the server crashes in the middle of an operation.

## Bibliografía
**Documentación:**
+ [documentación OFICIAL](https://mariadb.com/kb/en/sql-statements-structure/)
+ [doc MySQL](https://dev.mysql.com/doc/refman/8.0/en/)
+ [doc OBSOLETA en ES](https://www.sql-easy.com/es/)
+ [a]()

**Tutoriales:**
+ [Lo más simple](https://www.sql-easy.com/es/)
+ []
+ [W3School.com](https://www.w3schools.com/mysql/default.asp)

**Video-tutoriales**
+
