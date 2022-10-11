---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T1 (bis) Ampliación de Git

Duración: 0 horas (opcional).
Fecha de examen: **no evaluable**

## Recuperar REPO a estado anterior
- Modo **SEGURO**: `git checkout HASH_COMMIT` -> Crea una nueva rama donde todos los archivos están con el estado del commit pasado.

- Modo *inseguro*: `git reset -soft HASH_COMMIT` -> borra todo lo posterior a ese commit, pero *mantiene* los archivos que estén en el *staing area*.
- Modo **muy** *inseguro*: `git reset -hard HASH_COMMIT` -> borra todo lo posterior a ese commit

## Revisión gráfica de archivos y estructura:
Podemos "montar" un pequeño servidor para revisar de forma gráfica el estado de nuestro REPO con `git instaweb --httpd=webrick` o `git instaweb --httpd=webrick --port=1235`.

Una vez montado, podemos descargarnos el *tar.gz* con la estructura y revisarlo on-line.


---
Fin de tema.
