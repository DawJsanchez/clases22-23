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

## Borrando archivos secretos
Todos cometemos errores y en ocasiones podemos exponer la seguridad de nuestros proyectos al haber publicado por error información sensible... ¿que hacemos?

La herramienta que desea es `git filter-branch`. Su uso se describe [aquí](http://progit.org/book/ch6-4.html#removing_a_file_from_every_commit), pero básicamente: \\
`$ git filter-branch --tree-filter 'rm -f my_file' HEAD` va a quitar "mi\_fichero" de /cada/  commit.

**Aviso** que este reescribe en cada commit, así que si pulsas en un repositorio remoto, usted tiene que (a) la fuerza de la actualización, y (b) todos los demás que se tira desde ahora usted va a tener duplicada de la cometa (ya que reescribió la historia), como se describe en la [`git rebase` página man](http://git-scm.com/docs/git-rebase#_recovering_from_upstream_rebase).

## Revisión gráfica de archivos y estructura:
Podemos "montar" un pequeño servidor para revisar de forma gráfica el estado de nuestro REPO con `git instaweb --httpd=webrick` o `git instaweb --httpd=webrick --port=1235`.

Una vez montado, podemos descargarnos el *tar.gz* con la estructura y revisarlo on-line.


# TIPs Git

+ [Referencia](https://ohshitgit.com/es)

Git es difícil: estropearlo es fácil y darse cuenta de cómo corregir tus
errores es jodidamente imposible. La documentación de Git sufre del
problema del huevo y la gallina, donde no puedes buscar cómo salir del
lio, *a menos de que ya sepas el nombre de lo que tienes que saber* para
poder arreglarlo.

Acá hay algunas horribles situaciones con las que me encontré y cómo,
eventualmente, pude resolverlas *en español simple* .

## Máquina del tiempo
[Oh shit, hice algo terriblemente mal, por favor dime que git tiene una maquina del tiempo mágica!?!](https://ohshitgit.com/es?ref=reactivisima.com#maquina-del-tiempo-magica)

```
git reflog
# verás una lista de todo lo que
# haz hecho en git, en todas las ramas!
# cada uno tiene un index HEAD@{index}
# busca el comando anterior al que rompio todo
git reset HEAD@{index}
# maquina del tiempo mágica
```

Puedes usar esto para recuperar cosas que borraste accidentalmente, o
simplemente para borrar cosas que intentaste hacer que rompieron el
repo, o para recuperate de un mal merge, o simplemente para volver a un
momento donde las cosas funcionaba. Yo uso `reflog` MUCHISIMO. Mega
agradecimiento para las muchiiiiismas personas que sugirieron que lo
agregue.

## Pequeño cambio (Git LOCAL)
[Oh shit, hice commit e inmediatamente me di cuenta que tenia que hacer un pequeño cambio!](https://ohshitgit.com/es?ref=reactivisima.com#cambiar-ultimo-commit)

**ADVERTENCIA**: nunca arregles commits públicos
```
# realizar cambios
git add . # o agregue archivos individuales
git commit --amend --no-edit
# ahora tu último commit contiene los cambios!
# **ADVERTENCIA**: nunca arregles commits públicos
```

Esto suele pasarme cuando hago commit y luego corro tests/linters... y
mátame, me olvide de poner un espacio antes de un signo igual. También
podrías realizar el cambio como un nuevo commit y luego hacer
`rebase -i` para realizar un squash the ambos cambios juntos, pero esta
manera es un millon de veces más rápido.

*Advertencia: Nunca deberías arreglar commits que han sido subidos a
ramas públicas/compartidas. Solo arregla commits que existan en tu copia
local o la vas a pasar mal.*

## Cambiar mensaje del último commint
[Oh shit, necesito cambiar el mensaje en mi último commit!](https://ohshitgit.com/es?ref=reactivisima.com#cambio-mensage-ultimo-commit)

```
git commit --amend
# sigue las indicaciones para cambiar el mensaje
```

Estúpidos formatos de mensajes de commits.

## Mover commit de rama

### Opción A
[Oh shit, accidentalmente hice commit de algo a master que debía haber sido en una nueva rama!](https://ohshitgit.com/es?ref=reactivisima.com#commit-a-master-accidental)

```
# crea una nueva rama desde master
git branch nombre-de-rama
# borra el último commit de la rama master
git reset HEAD~ --hard
git checkout nombre-de-rama
# tu commit ahora vive en al nueva rama :)
```

Nota: esto no funciona si ya haz realizado el push a una rama
pública/compartida, y si haz intentado otra cosa antes, podrías
necesitar hacer `git reset HEAD@{number-of-commits-back}` en vez de
`HEAD~` . Tristeza infinita. También, mucuuuuuchas personas sugirieron
una increible manera de hacer esto más corto que no la sabía. Gracias a
todos.

### Opción B
[Oh shit, accidentalmente hice commit a la rama equivocada!](https://ohshitgit.com/es?ref=reactivisima.com#commit-accidental-en-rama-equivocada)

```
# deshaz el útlimo commit, pero deja los cambio disponibles
git reset HEAD~ --soft
git stash
# muevete a la rama correcta
git checkout nombre-de-la-rama-correcta
git stash pop
git add . # or add individual files
git commit -m "your message here";
# ahora tus cambios estan en la rama correcta
```

Mucha gente sugirió usar `cherry-pick` para esta situacion, asi que, usa
la que más sentido te haga!

### Opción C
```
git checkout nombre-de-la-rama-correcta
# coge el último commit de master
git cherry-pick master
# borralo de master
git checkout master
git reset HEAD~ --hard
```
## Ver cambios
[Oh shit, trate de realizar un diff pero no pasó nada?!](https://ohshitgit.com/es?ref=reactivisima.com#donde-esta-mi-diff)

Si sabes que hiciste cambios a tus archivos, pero `diff` está vacío,
probablemente hiciste `add` de tus archivos y necesitas un flag
especial.

```
git diff --staged
```

Archivos abajo ¯\\\\\\~(ツ)~\\\_/¯ (si, se que esto es una
funcionalidad, no un error, pero es desconcertante y poco obvio la
primera vez que te sucede!)

## Deshacer un commit (o más)
[Oh shit, necesito deshacer un commit de hace 5 comits!](https://ohshitgit.com/es?ref=reactivisima.com#dehacer-un-commit)

```
# encuentra el commit que necesitas deshacer
git log
# usa las flechas para moverte para arriba y abajo en la historia
# una vez que encontraste el commit, guarda su hash
git revert [hash guardado]
# git va a crear un nuevo commit que deshace ese commit
# sigue las indicaciones para editar el mensaje del commit
# o simplemente guarda y haz el commit
```

Al parecer, no necesitas buscar y copiar-pegar el contenido del viejo
archivo al actual para deshacer los cambios! Si hiciste commit de un
bug, puedes deshacer el commit de una con `revert`

También puedes revertir un solo archivo en vez de todo un commit! Pero,
por supuesto, haciendo honor a la filosofia git, es un comando
totalmente distinto.

## Deshacer sólo 1 archivo
[Oh shit, necesito deshacer los cambio de un archivo!](https://ohshitgit.com/es?ref=reactivisima.com#deshacer-un-archivo)

```
# busca el hash del commit anterior de cuando se cambio el archivo
git log
# usa las flechas para moverte para arriba y abajo en la historia
# una vez que encontraste el commit, guarda su hash
git checkout [hash guardado] -- path/to/file
# la version anterior del archivo estará en tu index
git commit -m "Waw, no tienes que hacer copiar-pegar para deshacer"
```

Cuando me di cuenta de esto fue INCREIBLE. INCREBILE. IN-CRE-I-BLE. Pero
en serio, en que planeta de mierda `checkout --` hace sentido que sea la
mejor manera de deshacer un archivo? :shakes-fist-at-linus-torvalds:

## Limpieza total (reinicio del repo local)
[A la mierda este ruido, me doy por vencido.](https://ohshitgit.com/es?ref=reactivisima.com#fuck-this-noise)

```
cd ..
sudo rm -r fucking-git-repo-dir
git clone https://some.github.url/fucking-git-repo-dir.git
cd fucking-git-repo-dir
```

Gracias a Eric V. por esta. Todas las quejas por el uso de `sudo` en
este chiste pueden ser dirigidas a él.

En serio, si tu rama está tan rota que necesitas reiniciar el estado de
tu repo al mismo que el repo remoto en una manera aprobada por git,
prueba esto, pero ten en cuenta que son acciones destructivas e
irrecuperables!

```
# recupera el último estado del origen
git fetch origin
git checkout master
git reset --hard origin/master
# elimina los archivos y directorios sin seguimiento
git clean -d --force
# repite checkout/reset/clean para cada rama rota
```

***Descargo***: Este sitio no está pensado para ser una referencia
exhaustiva. Y sí, hay otras maneras de hacer las mismas cosas de una
forma teóricamente más puras, pero yo llegué a estos pasos por prueba y
error y muchas puteadas, y tuve esta loca idea de compartirlas con una
sana dosis de insultos. Tómalo o déjalo, como quieras!



---
Fin de tema.
