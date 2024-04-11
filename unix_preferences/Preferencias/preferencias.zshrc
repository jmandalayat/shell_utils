##################################################################################
#                                                                                #
# Mis preferencias de inicio (~/.zprofile, ~/.zshrc):                            #
#	- Ejecutado por el intérprete de comandos cuando un usuario inicia sesión    #
#	(~/.zprofile) o cuando se inicia una nueva shell habiendo ya iniciado sesión #
#	un usuario (~/.zshrc).                                                       #
#	- El archivo ~/.zprofile no es leído por bash(1) si ~/.zsh_profile o         #
#	~/.zsh_login existen.                                                        #
#	- Consulte /usr/share/doc/bash/examples/startup-files (en el paquete         #
#	"bash-doc") para más ejemplos.                                               #
#                                                                                #
##################################################################################



# Configuración básica

## La umask por defecto se configura en /etc/profile. Para configurar umask para accesos por ssh, instala y configura el paquete libpam-umask.
#umask 022.

## Configuración de variables y rutas del entorno
if [[ -f ~/.var ]]
then
	. ~/.var
fi

## Definición de alias especificados en el archivo ~/.aliases.
if [[ -f ~/.aliases ]]
then
	. ~/.aliases
fi

## Configuración del "prompt indicada en .prompt"
if [[ $SESSION_TYPE != "Darwin$SHELL" ]] && [[ -f ~/.prompt ]]
then
	. ~/.prompt
fi

if [[ $SESSION_TYPE != "Darwin$SHELL" ]] # Estas opciones no se aplican en Mac
then

	## Si no se ejecuta interactivamente, que no se haga nada
	case $- in
		*i*) ;;
		*) return;;
	esac

	## Configuración del historial

	### No se escriban líneas duplicadas o líneas empezando con espacios en el historial. Consulte bash(1) para más opciones.
	HISTCONTROL=ignoreboth

	### Añádase al archivo del historial, no sobreescriba.
	shopt -s histappend

	### Para configurar la longitud del historial, consulte HISTSIZE y HISTFILESIZE en bash(1).
	HISTSIZE=1000
	HISTFILESIZE=2000

	## Se comprueba el tamaño de la ventana después de cada comando y, si es necesario, se actualiza el valor de LINES y COLUMNS.
	shopt -s checkwinsize

	## Si se configura, el patrón "**" usado en el contexto de una expansión de nombre de ruta se referirá a todos los archivos, directorios y subdirectorios.
	shopt -s globstar

	## Se hace el comando "less" más amigable para archivos de entrada que no sean de texto. Consulte lesspipe(1).
	[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

	## Se habilitan características de completado.
	if ! shopt -oq posix
	then
		if [ -f /usr/share/bash-completion/bash_completion ]
		then
			. /usr/share/bash-completion/bash_completion
		elif [ -f /etc/bash_completion ]
		then
			. /etc/bash_completion
		fi
	fi
fi



# Opciones de Google Cloud SDK

# Se habilita el completado para "gcloud"
if [[ -f "$GCLOUD_HOME/completion.bash.inc" ]] && [[ $SESSION_TYPE != "Darwin$SHELL" ]]
then
	. "$GCLOUD_HOME/completion.bash.inc"
fi



# Presentación al abrir la terminal

## Saludo inicial
echo
echo "Saludos, veterano liberal"

## Se muestra la fecha actual
echo
echo -n "Hoy es "
date

## Se muestra el calendario
if [[ $(whereis ncal | grep "/") ]]
then
	echo
	if [[ $SESSION_TYPE == "Darwin$SHELL" ]]
	then
		ncal -3w
	else
		ncal -b3wM
	fi
fi

## Se indica la IP en la red de área local
echo
echo "IP LAN: $IP"

## Se indica la IP pública
if [[ -n $P_IP ]]
then
	echo
	echo "IP pública: $P_IP"
fi

## Se muestra una frase motivacional
if [[ $(whereis fortune | grep "/") ]] && [[ $(whereis cowsay | grep "/") ]]
then
	fortune -a | cowsay
fi
