#! /bin/bash

for filename in $(ls)
do
	tesseract "$filename" temp_salida.txt
	if [[ $(grep "termino" temp_salida.txt) ]]
	then
		echo "Positivo en $filename" >> resultado.txt
	fi
done

rm temp_salida.txt
