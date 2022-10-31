#!/bin/bash
# Limpiamos y restauramos pwd
trap "echo Saliendo...; cd ${RAIZ}; exit" SIGINT

# Salvamos pwd
RAIZ="$PWD"

# Función actualiza todos los repos de un directorio
# 	@param DIR recibe el directorio absoluto o relativo donde buscar
#	Recorre todo el DIR realizando `git pull` de todos los repos contenidos en él
_actualiza_repo(){
	for F in `ls $1/` ; do
		echo "-----------------------------------------------"
		echo "Actualizando $F"
		cd "$PWD/${1}/${F}"
		git pull
		git push
		cd $RAIZ
	done
}

# Llamo a cada conjunto de repos a actualizar
#	Requiere que los repos sean `git clone` de un repo remoto
_actualiza_repo 'mios'
_actualiza_repo '1-DAW'
_actualiza_repo '2-DAW'
