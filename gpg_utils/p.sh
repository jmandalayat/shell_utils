#! /bin/bash

if [[ $(gpg --encrypt --recipient FINGERPRINTDELACONTRA --output /dev/null chat.txt | grep "failed") ]]
then
	echo "Positivo"
else
	echo "Negativo"
fi
