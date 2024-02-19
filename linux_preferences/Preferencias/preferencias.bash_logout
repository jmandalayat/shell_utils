#############################################################
#                                                           #
# Mis preferencias de fin de sesión (~/.bash_logout).       #
# Ejecutado por bash(1) cuando la shell operante se cierra. #
#                                                           #
#############################################################


# Se limpia el historial

history -c
cat /dev/null > $HISTFILE


# Cuando se abandona la consola, límpiese la pantalla para incrementar la privacidad.

if [[ $SESSION_TYPE != "Darwin$SHELL" ]] && [[ "$SHLVL" = 1 ]]
then
	[ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
