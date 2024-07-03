#! /bin/bash

if [[ -f "$P_IP_HIST" ]]
then
	curl -s ifconfig.me >> "$P_IP_HIST"
	echo -ne "\t| " >> "$P_IP_HIST"
	date >> "$P_IP_HIST"
else
	echo "La ruta al archivo de IP pública apunta a un archivo inexistente"
fi
