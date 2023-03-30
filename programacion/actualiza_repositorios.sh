#!/bin/bash
# Limpiamos y restauramos pwd
_limpiamos(){
	echo Saliendo...;
	cd ${RAIZ};
	rm ~/salida.txt;
	rm ~/error.txt;
	exit
}
trap _limpiamos SIGINT

# CONSTANTES
Reset='\e[0m'
Bright='\e[1m'
Dim='\e[2m'
Underscore='\e[4m'
Blink='\e[5m'
Reverse='\e[7m'
Hidden='\e[8m'

FgBlack='\e[30m'
FgRed='\e[31m'
FgGreen='\e[32m'
FgYellow='\e[33m'
FgBlue='\e[34m'
FgMagenta='\e[35m'
FgCyan='\e[36m'
FgWhite='\e[37m'

BgBlack='\e[40m'
BgRed='\e[41m'
BgGreen='\e[42m'
BgYellow='\e[43m'
BgBlue='\e[44m'
BgMagenta='\e[45m'
BgCyan='\e[46m'
BgWhite='\e[47m'

# Salvamos pwd
RAIZ="$PWD"

# Función actualiza todos los repos de un directorio
# 	@param DIR recibe el directorio absoluto o relativo donde buscar
#	Recorre todo el DIR realizando `git pull` de todos los repos contenidos en él
_actualiza_repo(){
	echo ""
	echo "==================================================="
	echo -e "${FgWhite}${BgGreen}\t \t ${1}${Reset}"
	echo "==================================================="
	sleep 1
	for F in `ls $1/` ; do
		if [[ -d $1 ]]; then
		  cd "$PWD/${1}/${F}" 2>/dev/null || continue

			git pull 1>"$HOME/salida.txt" 2> /dev/null;
			salida=$(cat ~/salida.txt);
			if [[ ('Ya está actualizado.' == "$salida") || ('Already up to date.' == "$salida") ]]; then
				echo -e "${FgGreen}\t $F sin cambios.${Reset}"
			else
				#LOG="$RAIZ/mios/privado/logs/.${1}-${F}.log"
				#if [[ ! -f "$LOG" ]]; then touch "$LOG"; fi
				echo -e "${FgWhite}${BgRed}Actualizando ${F} ${Reset}"
				echo -e "${FgRed}${salida}${Reset}"
				#echo -e "$(date), $(grep -E 'changed|deletion|insertion' ~/salida.txt)" >> "$LOG"
			fi

			# git pull
			git status 1>"$HOME/salida" 2> "$HOME/error.txt"
			#cat "$HOME/salida" | grep -q 'Tu rama está actualizada con '
			cat "$HOME/salida" | grep -q -E 'Cambios no rastreados|Archivos sin seguimiento'
			if [[ $? -eq 0 ]]; then
				#cat "$HOME/salida"
				git status
				git push 1>"$HOME/salida.txt" 2> "$HOME/error.txt"
				alDia=$(cat ~/error.txt);
				if [[ 'Everything up-to-date' == "$alDia" ]]; then
					echo -e "${FgGreen}\t \t Al día (push)${Reset}"
				else
					echo -e "$̣̣{FgRed}\t \t $(cat $HOME/salida.txt) ${Reset}"
					echo -e "${FgWhite}${BgRed}\t \t ${FgRed} $(cat $HOME/error.txt) ${Reset}"
				fi
			else
				echo -e "${FgGreen}\t \t Al día (status)${Reset}"
			fi
			cd $RAIZ
		fi
	done
}

# Llamo a cada conjunto de repos a actualizar
#	Requiere que los repos sean `git clone` de un repo remoto
_actualiza_repo 'mios'
_actualiza_repo '1-DAW'
_actualiza_repo '2-DAW'
