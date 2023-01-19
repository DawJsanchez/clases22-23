---
 DeApWeb - Despliegue de Aplicaciones Web
---

# T1 (bis) Ampliación de Git

Duración: 0 horas (opcional).
Fecha de examen: **no evaluable**

## Mensaje en los commits
1. Usa el verbo imperativo (Add, Change, Fix, Remove, …)
2. No uses punto final ni puntos suspensivos en tus mensajes
3. Usa como máximo 50 carácteres para tu mensaje de commit
4. Añade todo el contexto que sea necesario en el cuerpo del mensaje de commit \
   Sólo el primer `-m` es título del `commit`, siendo los siguientes el cuerpo del mensaje. P.e.: `git commit -m "Add feature" -m "Aquí el cuerpo del mensaje..."`

[Amplia INFO](https://midu.dev/buenas-practicas-escribir-commits-git/)

## Merge/rebase Fast-forward




## Recuperar REPO a estado anterior
- Modo **SEGURO**: `git checkout HASH_COMMIT` -> Crea una nueva rama donde todos los archivos están con el estado del commit pasado.
- Modo **SEGURO**: `git revert` -> Crea un commit que revierte el último commit. Para más cambios ver doc oficial.

- Modo *inseguro*: `git reset -soft HASH_COMMIT` -> borra todo lo posterior a ese commit, pero *mantiene* los archivos que estén en el *staing area*.
- Modo **muy** *inseguro*: `git reset -hard HASH_COMMIT` -> borra todo lo posterior a ese commit

## Revisión gráfica de archivos y estructura:
Podemos "montar" un pequeño servidor para revisar de forma gráfica el estado de nuestro REPO con `git instaweb --httpd=webrick` o `git instaweb --httpd=webrick --port=1235`.

Una vez montado, podemos descargarnos el *tar.gz* con la estructura y revisarlo on-line.


---
Fin de tema.
