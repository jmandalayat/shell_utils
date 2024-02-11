#! /bin/bash

for i in {1..$ultimo}
do
	echo "$prin_url-$i-$fin_url" >> desc.txt
done

yt-dlp -a desc.txt

rm desc.txt

for f in *.ts
do
	mv "$f" "$f.mp4"
done

for f in *.mp4
do
	echo "file '$f'" >> input.txt
done

ffmpeg -f concat -i input.txt -c copy output.mp4

rm input.txt
