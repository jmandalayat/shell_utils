#! /bin/bash

if [[ $# == 1 ]]
then
	curl -s "https://www.rfc-editor.org/rfc/rfc$1.txt"
else
	echo "Modo de uso:"
	echo "  rfc [Nº de RFC]"
fi
