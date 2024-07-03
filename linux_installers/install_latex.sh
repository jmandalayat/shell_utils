#! /bin/bash



# Paquete completo de LaTeX

echo "¿Instalar paquete completo de LaTeX?"
read -p "(y/n): " resp

echo

if [[ $resp == "y" ]]
then
	echo "Confirmado"
	echo
	sudo apt-get install -y texlive-full
elif [[ $resp == "n" ]]
then
	echo "Cancelado por el usuario"
	echo
	echo "Se instalará el paquete reducido de LaTeX"
	echo
	# LaTeX parcial
	sudo apt-get install -y texlive texlive-base texlive-latex-recommended texlive-latex-extra
else
	echo "Cancelado (respuesta inválida)"
	echo
	echo "Se instalará el paquete reducido de LaTeX"
	echo
	# LaTeX parcial
	sudo apt-get install -y texlive texlive-base texlive-latex-recommended texlive-latex-extra
fi




# Soporte para todos los idiomas

echo "¿Instalar soporte para todos los idiomas?"
read -p "(y/n): " resp

echo

if [[ $resp == "y" ]]
then
	echo "Confirmado"
	echo
	sudo apt-get install -y texlive-lang-all
elif [[ $resp == "n" ]]
then
	echo "Cancelado por el usuario"
	echo
	echo "No se instalará soporte para todos los idiomas"
else
	echo "Cancelado (respuesta inválida)"
	echo
	echo "No se instalará soporte para todos los idiomas"
fi

echo



# Bibliografía

echo "¿Instalar soporte de bibliografía?"
read -p "(y/n): " resp

echo

if [[ $resp == "y" ]]
then
	echo "Confirmado"
	echo
	sudo apt-get install -y texlive-bibtex-extra biber
elif [[ $resp == "n" ]]
then
	echo "Cancelado por el usuario"
	echo
	echo "No se instalará soporte de bibliografía"
else
	echo "Cancelado (respuesta inválida)"
	echo
	echo "No se instalará soporte de bibliografía"
fi

echo



# Fuentes adicionales

echo "¿Instalar fuentes adicionales?"
read -p "(y/n): " resp

echo

if [[ $resp == "y" ]]
then
	echo "Confirmado"
	echo
	sudo apt-get install -y ttf-*
elif [[ $resp == "n" ]]
then
	echo "Cancelado por el usuario"
	echo
	echo "No se instalarán fuentes adicionales"
else
	echo "Cancelado (respuesta inválida)"
	echo
	echo "No se instalarán fuentes adicionales"
fi

echo



# Editor Texmaker

echo "¿Instalar editor Texmaker?"
read -p "(y/n): " resp

echo

if [[ $resp == "y" ]]
then
	echo "Confirmado"
	echo
	sudo apt-get install -y texmaker
elif [[ $resp == "n" ]]
then
	echo "Cancelado por el usuario"
	echo
	echo "No se instalará el editor Texmaker"
else
	echo "Cancelado (respuesta inválida)"
	echo
	echo "No se instalará el editor Texmaker"
fi



# Editor KBibTeX

echo "¿Instalar editor KBibTeX?"
read -p "(y/n): " resp

echo

if [[ $resp == "y" ]]
then
	echo "Confirmado"
	echo
	sudo apt-get install -y kbibtex
elif [[ $resp == "n" ]]
then
	echo "Cancelado por el usuario"
	echo
	echo "No se instalará el editor KBibTeX"
else
	echo "Cancelado (respuesta inválida)"
	echo
	echo "No se instalará el editor KBibTeX"
fi
