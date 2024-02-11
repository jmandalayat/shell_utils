#! /bin/bash

# Eliminar ficheros de compiñación anteriores
rm *.aux
rm *.bcf
rm *.lof
rm *.log
rm *.lot
rm *.out
rm *.run.xml
rm *.synctex.gz
rm *.toc
rm pdfa.xmpi
rm *.bbl
rm *.blg

# Compilar con pdflatex
lualatex -interaction=nonstopmode *.tex

# Compilar con Biber
biber *.bcf

# Compilar con pdflatex
lualatex -interaction=nonstopmode *.tex
