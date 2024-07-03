curl -s https://cloud.google.com/sdk/docs/release-notes -o release-notes.txt

BEFORE=0
FOUND=False

if [[ $(grep $(date -d "$BEFORE days ago" +%Y-%m-%d) release-notes.txt) ]]
then
	FOUND=True
fi
while [[ $FOUND = False ]]
do
	let BEFORE=$BEFORE+1

	if [[ $(grep $(date -d "$BEFORE days ago" +%Y-%m-%d) release-notes.txt) ]]
	then
		FOUND=True
	fi
done

grep $(date -d "$BEFORE days ago" +%Y-%m-%d) release-notes.txt

rm release-notes.txt
