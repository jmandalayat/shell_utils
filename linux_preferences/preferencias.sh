#! /bin/bash



echo



echo "Actualizando preferencias de usuario:"
ls "$PREF"
echo

if [[ "$PREF/preferencias.bashrc" ]]
then
	cp "$PREF/preferencias.bashrc" "$HOME/.bashrc"
fi

if [[ -f "$PREF/preferencias.bash_aliases" ]]
then
	cp "$PREF/preferencias.bash_aliases" "$HOME/.bash_aliases"
fi

if [[ -f "$PREF/preferencias.bash_logout" ]]
then
	cp "$PREF/preferencias.bash_logout" "$HOME/.bash_logout"
fi

if [[ -f "$PREF/preferencias.bash_prompt" ]]
then
	cp "$PREF/preferencias.bash_prompt" "$HOME/.bash_prompt"
fi

if [[ -f "$PREF/preferencias.bash_var" ]]
then
	cp "$PREF/preferencias.bash_var" "$HOME/.bash_var"
fi

if [[ -f "$PREF/preferencias.profile" ]]
then
	cp "$PREF/preferencias.profile" "$HOME/.profile"
fi



echo "Importando atajos de teclado"
echo

if [[ -f "$PREF/KDE/kdeglobals" && -f ~/.config/kdeglobals ]]
then
	cp "$PREF/KDE/kdeglobals" ~/.config/kdeglobals
fi

if [[ -f "$PREF/KDE/kglobalshortcutsrc" && -f ~/.config/kglobalshortcutsrc ]]
then
	cp "$PREF/KDE/kglobalshortcutsrc" ~/.config/kglobalshortcutsrc
fi

if [[ -f "$PREF/KDE/khotkeysrc" && -f ~/.config/khotkeysrc ]]
then
	cp "$PREF/KDE/khotkeysrc" ~/.config/khotkeysrc
fi



echo "Importando configuración de Dolphin"
echo

if [[ -f "$PREF/KDE/dolphinrc" && -f ~/.config/dolphinrc ]]
then
	cp "$PREF/KDE/dolphinrc" ~/.config/dolphinrc
fi

if [[ -f "$PREF/KDE/dolphin" && -f ~/.local/share/kxmlgui5/dolphin ]]
then
	cp "$PREF/KDE/dolphin" ~/.local/share/kxmlgui5/dolphin
fi

if [[ -f "$PREF/KDE/view_properties" && -f ~/.local/share/dolphin/view_properties ]]
then
	cp "$PREF/KDE/view_properties" ~/.local/share/dolphin/view_properties
fi

if [[ -f "$PREF/KDE/dolphinui.rc." && -f ~/.local/share/kxmlgui5/dolphin/dolphinui.rc. ]]
then
	cp "$PREF/KDE/dolphinui.rc." ~/.local/share/kxmlgui5/dolphin/dolphinui.rc.
fi



echo "Importando marcadores"
echo

if [[ -f "$PREF/KDE/user-places.xbel" && -f ~/.local/share/user-places.xbel ]]
then
	cp "$PREF/KDE/user-places.xbel" ~/.local/share/user-places.xbel
fi



echo "Las preferencias han sido actualizadas"
