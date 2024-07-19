#! /bin/bash

if [[ $# == 4 ]]
then
	ffmpeg -i "$1" -ss $2 -t $3 -acodec copy $4
else
	echo "Modo de uso:"
	echo "  recortar_audio [archivo de entrada] [inicio] [duración] [archivo de salida]"
	echo
	echo "Formato del instante de inicio y la duración:"
	echo "  [horas]:[minutos]:[segundos]"
	echo
	echo "Ejemplo:"
	echo '  recortar_audio entrada.mp3 00:25:40 01:32:54 salida.mp3'
fi
