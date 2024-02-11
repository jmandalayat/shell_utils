#!/bin/bash

echo
echo "Moviendo el contenido de MV local a tu carpeta personal:"
ls ~/MV

mv ~/MV/* /mnt/c/Users/$WINDIR/MV/

echo
echo "El contenido ha cambiado su ubicación a la otra carpeta:"
ls /mnt/c/Users/$WINDIR/MV/
