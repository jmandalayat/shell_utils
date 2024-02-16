#! /bin/bash

if [[ $# -gt 1 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   gen_gpg_k [correo electrónico]"
    echo "   gen_gpg_k (correo electrónico generado de manera aleatoria)"
	exit
fi

# Se genera un nombre de usuario aleatorio
if [[ $# == 0 ]]
then
	usuario="$(gpg --gen-random --armour 2 9)@gmail.com"
fi

if [[ $# == 1 ]]
then
	usuario=$1
fi

# Se genera una contraseña aleatoria
supercontra=$(gpg --gen-random --armour 2 51)

# Se genera la clave
gpg --quick-generate-key --batch --passphrase $supercontra $usuario RSA4096 encrypt never

# Se muestra el usuario
echo
echo "Usuario de la clave: $usuario"

# Se muestra la contraseña
echo
echo "Contraseña de la clave: $supercontra"



#if [[ $(gpg --encrypt --recipient FINGERPRINTDELACONTRA --output /dev/null chat.txt | grep "failed") ]]
#then
#	echo "Positivo"
#else
#	echo "Negativo"
#fi