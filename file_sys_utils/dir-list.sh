#! /bin/bash

for n in {1..6}
do
	direc=$(head -n $n lista.txt | tail -n 1)

	mkdir -p "$direc"
done
