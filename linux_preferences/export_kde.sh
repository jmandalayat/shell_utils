#! /bin/bash

echo "Exportando atajos de teclado"
echo

if [[ -f ~/.config/kdeglobals ]]
then
	cp ~/.config/kdeglobals "$PREF/KDE/kdeglobals"
fi

if [[ -f ~/.config/kglobalshortcutsrc ]]
then
	cp ~/.config/kglobalshortcutsrc "$PREF/KDE/kglobalshortcutsrc"
fi

if [[ -f ~/.config/khotkeysrc ]]
then
	cp ~/.config/khotkeysrc "$PREF/KDE/khotkeysrc"
fi



echo "Exportando configuración de Dolphin"
echo

if [[ -f ~/.config/dolphinrc ]]
then
	cp ~/.config/dolphinrc "$PREF/KDE/dolphinrc"
fi

if [[ -f ~/.local/share/kxmlgui5/dolphin ]]
then
	cp ~/.local/share/kxmlgui5/dolphin "$PREF/KDE/dolphin"
fi

if [[ -f ~/.local/share/dolphin/view_properties ]]
then
	cp ~/.local/share/dolphin/view_properties "$PREF/KDE/view_properties"
fi

if [[ -f ~/.local/share/kxmlgui5/dolphin/dolphinui.rc. ]]
then
	cp ~/.local/share/kxmlgui5/dolphin/dolphinui.rc. "$PREF/KDE/dolphinui.rc."
fi



echo "Exportando marcadores"
echo

if [[ -f ~/.local/share/user-places.xbel ]]
then
	cp ~/.local/share/user-places.xbel "$PREF/KDE/user-places.xbel"
fi
