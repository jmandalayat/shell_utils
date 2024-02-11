#!/bin/bash

echo
echo "Moviendo el contenido de tu carpeta personal a MV local:"
ls /mnt/c/Users/$WINDIR/MV/

mv /mnt/c/Users/$WINDIR/MV/* ~/MV/

echo
echo "El contenido ha cambiado su ubicación a la otra carpeta:"
ls ~/MV/
