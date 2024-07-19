#! /bin/bash

for i in $(cat $1)
do
	echo -n '```'
	echo -n $i
	echo '```'
done
