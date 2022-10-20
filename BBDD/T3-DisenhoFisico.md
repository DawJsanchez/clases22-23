---
 BBDD - Bases de Datos
---

# T3 Diseño físico

Duración: 21 horas.

## Lenguaje de consultas estructuradas -SQL-
Es un lenguaje estandar estructurado diseñado para administrar y recuperar información de SGBD. La versión más actual es la ANSI SQL:2016.

Desgraciadamente, cada fabricante ha desarrollado su propio dialecto para que el usuarrio pueda extender sus funcinalidades con procedimientos y funciones. \
Nosotros utilizaremos MariaDB en su rama 10.X. La misma fue compatible plenamente con MySQL hasta la versión 5.5 en la que ambos desarrollos separaron caminos.

Se divide en 3 partes:
+ LDD (lenguaje de definición de datos): Incluye sentencias para gestionar las estructuras.
+ LMD (lenguaje de manipulación de datos): Incluye sentencias para gestionar los datos.
+ LCD (lenjuage de control de datos): Incluye sentencias para gestionar la seguridad y los permisos.



## CREATE
Según la [documentación OFICIAL](https://mariadb.com/kb/en/create-table/):
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
Donde *create_definition* es:
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

O paso por paso, apoyándonos en [W3School.com](https://www.w3schools.com/mysql/default.asp):
```
CREATE TABLE ciclista (numFederado INT NOT NULL AUTO_INCREMENT,
							nombre VARCHAR(20),
							nacionalidad VARCHAR(20),
							fechaNacimiento DATE,
							PRIMARY KEY(numFederado)
							);
```

### Ejercicio:
Crea el resto de tablas del ejercicio propuesto de examen Modelo ER-RELACIONAL
