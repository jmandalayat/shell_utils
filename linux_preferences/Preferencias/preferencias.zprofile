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

## Preferencias comunes en Bash y Zsh.
if [[ -f ~/.common_profile ]]
then
	. ~/.common_profile
fi