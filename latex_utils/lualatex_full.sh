#! /bin/bash

# Eliminar ficheros de compiñación anteriores
rm *.aux
rm *.bbl
rm *.bcf
rm *.blg
rm *.cut
rm *.lof
rm *.log
rm *.lot
rm *.out
rm *.pytxcode
rm *.run.xml
rm *.synctex
rm *.synctex.gz
rm "*.synctex.gz(busy)"
rm *.toc
rm pdfa.xmpi

# Compilar con pdflatex
lualatex -interaction=nonstopmode *.tex

# Compilar con Biber
biber *.bcf

# Compilar con pdflatex
lualatex -interaction=nonstopmode *.tex
